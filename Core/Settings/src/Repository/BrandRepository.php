<?php
/**
 * Created by PhpStorm.
 * User: WeSSaM
 * Date: 15/01/2020
 * Time: 12:07 PM
 */

namespace Core\Settings\Repository;

use App\Exceptions\ResourceManipulationException;
use App\Repositories\ImageRepository;
use App\Repositories\ModelRepository;
use App\Scopes\FilterScope;
use Core\Settings\Interfaces\TaxesInterface;
use Core\Settings\Models\Brand;
use Core\Settings\Models\Category;
use Core\Settings\Models\Resources\BrandResource;
use Illuminate\Http\Request;

class BrandRepository extends ModelRepository implements TaxesInterface
{
    public $modelRepository;

    public $model = Brand::class;
    public $relation = 'brands';
    public $guard = ADMIN_GUARD;
    public $resource = BrandResource::class;
    public $orderBy = 'created_at';
    public $sortBy = 'DESC';
    private $query;

    /**
     * @author WeSSaM
     * BrandRepository constructor.
     * @param Brand $brand
     */
    public function __construct(Brand $brand)
    {
        $this->query = $brand;
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \App\Exceptions\ResourceManipulationException
     * @throws \App\Exceptions\UploadErrorException
     */
    public function store(Request $request)
    {
        $item = new $this->model;
        $item->fill(array_merge($request->only($this->model::FILLABLE), [
            'parent_id' => @$request->parent['id'],
            'user_id' => $this->auth()->id
        ]));
        if ($item->save()) {
            if (isset($request->icon)) {
                $imageRepository = new ImageRepository;
                $image = $imageRepository->store($item, @$imageRepository->uploadBase64($request->icon));
                if (isset($image)) {
                    $item->icon = $image->file_name;
                    $item->save();
                }
            }
            if (isset($request->applied_categories))
                foreach ($request->applied_categories as $category) {
                    $item->appliedCategories()->attach($category, ['type' => 1, 'appliable_type' => Category::class]);
                }
            return $item;
        }
        throw  new ResourceManipulationException(trans('lang.save_error'), RESOURCE_MANIPULATION);
    }


    /**
     * @param $id
     * @param Request $request
     * @return mixed
     * @throws ResourceManipulationException
     * @throws \App\Exceptions\UnknownRelationException
     * @throws \App\Exceptions\UploadErrorException
     */
    public function update($id, Request $request)
    {
        $model = $this->find($id);

        $status = $model->update(array_merge($request->only($this->model::FILLABLE), [
            'parent_id' => @$request->parent['id'],
            'user_id' => $this->auth()->id
        ]));

        if ($status) {
            if (isset($request->icon)) {
                $imageRepository = new ImageRepository;
                $image = $imageRepository->store($model, @$imageRepository->uploadBase64($request->icon));
                if (isset($image)) {
                    $model->icon = $image->file_name;
                    $model->save();
                }
            }
            if (isset($request->applied_categories))
                foreach ($request->applied_categories as $category) {
                    if (!$model->have('appliedCategories', $category))
                        $model->appliedCategories()->attach($category, ['type' => 1, 'appliable_type' => Category::class]);
                }
            $model->detach('appliedCategories', custom_array_map($request->applied_categories));

            return $model;
        }

        throw  new ResourceManipulationException(trans('lang.save_error'), RESOURCE_MANIPULATION);
    }

    /**
     * @return mixed
     * @throws \App\Exceptions\UnknownRelationException
     */
    public function all()
    {
        return $this->query()->get();
    }


    /**
     * @return mixed
     * @throws \App\Exceptions\UnknownRelationException
     */
    public function allWithResource()
    {
        return $this->resource::collection($this->all());
    }


    /**
     * @param array $attributes
     * @return mixed
     * @throws \App\Exceptions\UnknownRelationException
     */
    public function query($attributes = ['*'])
    {
        return parent::query($attributes)->withoutGlobalScope(FilterScope::class); // TODO: Change the autogenerated stub
    }
}