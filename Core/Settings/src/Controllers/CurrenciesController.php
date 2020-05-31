<?php


namespace Core\Settings\Controllers;


use App\Currency;
use Core\Settings\Collections\CurrencyResource;



use App\Exceptions\ModelDeleteException;
use App\Exceptions\ResourceManipulationException;
use Core\Settings\Requests\CurrencyRequest;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

use Illuminate\Routing\Controller as BaseController;

class CurrenciesController extends BaseController
{


    /**
     * @return mixed
     */
   /* public function fetch()
    {
        $currencies = Currency::active()->get();
        return response()->api(SUCCESS_RESPONSE, '', CurrencyResource::collection($currencies), SUCCESS_STATUS);
    }*/

    public function fetch(Request $request)
    {
        $request->request->set('per_page', isset($request->per_page) ? $request->per_page : 10);
//        $cities = auth_user()->cities()->filter($request)->paginate($request->per_page);
        $currencies = Currency::query()->filter($request)->paginate($request->per_page);
        return response()->api(SUCCESS_RESPONSE, '', resourcePaginator($currencies, CurrencyResource::class), SUCCESS_STATUS);
    }
    public function store(CurrencyRequest $request)
    {
        try {
            $currency = Currency::create(array_merge(['user_id' => auth(SUPER_ADMIN_GUARD)->id()], $request->only(Currency::FILLABLE)));
            return response()->api(SUCCESS_RESPONSE, trans('Settings::lang.settings.currency_stored_successfully'), []);
        } catch (ResourceManipulationException $resourceManipulationException) {
            return response()->api(ERROR_RESPONSE, $resourceManipulationException->getMessage(), [], $resourceManipulationException->getCode());
        }
    }




    /**
     * @param $currency
     * @return mixed
     */
    public function find($currency)
    {
//        $currency = auth_user()->currencies()->find($currency);
        $currency = Currency::query()->find($currency);
        return response()->api(SUCCESS_RESPONSE, '', new CurrencyResource($currency), SUCCESS_STATUS);
    }


    /**
     * @param $currency
     * @param CurrencyRequest $request
     * @return mixed
     */
    public function update($currency, CurrencyRequest $request)
    {
        try {
            $currency = Currency::updateOrCreate(['id' => $currency], $request->only(Currency::FILLABLE));
            return response()->api(SUCCESS_RESPONSE, trans('Settings::lang.currency_updated_successfully'), []);
        } catch (ResourceManipulationException $resourceManipulationException) {
            return response()->api(ERROR_RESPONSE, $resourceManipulationException->getMessage(), [], $resourceManipulationException->getCode());
        }
    }

    /**
     * @param $id
     * @param Request $request
     * @return mixed
     */
    public function activate($id, Request $request)
    {
        try {
            $currency = auth(SUPER_ADMIN_GUARD)->user()->currencies()->find($id);
            $currency->update(['is_active' => (int)$request->is_active]);
            return response()->api(SUCCESS_RESPONSE, trans('Settings::lang.currency_status_successfully'), [], SUCCESS_STATUS);
        } catch (ModelNotFoundException $exception) {
            return response()->api(ERROR_RESPONSE, trans('Settings::lang.model_not_found'), [], RESOURCE_NOT_FOUND);
        }
    }

    /**
     * @param $currency
     * @return mixed
     * @throws \Exception
     */
    public function delete($currency)
    {
        try {
            $currency = Currency::query()->find($currency);
//            $currency = auth(SUPER_ADMIN_GUARD)->user()->currencies()->find($currency);
            if ($currency->canDelete()) {
                $currency->delete();
                return response()->api(SUCCESS_RESPONSE, trans('Settings::lang.currency_deleted_successfully'), [], SUCCESS_STATUS);
            }
            return response()->api(ERROR_RESPONSE, trans('Settings::lang.can_not_delete_currency'), [], SUCCESS_STATUS);
        } catch (ModelDeleteException $modelDeleteException) {
            return response()->api(ERROR_RESPONSE, $modelDeleteException->getMessage(), [], $modelDeleteException->getCode());
        }
    }

    /**
     * get all currencies
     *
     * @return mixed
     * @author Amr
     */
    public function index()
    {
        $currencies = Currency::all();
        return response()->api(SUCCESS_RESPONSE, '', $currencies);
    }

}
