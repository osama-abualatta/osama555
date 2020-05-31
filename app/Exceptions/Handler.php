<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Validation\ValidationException;
use Symfony\Component\Routing\Exception\RouteNotFoundException;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Report or log an exception.
     *
     * @param \Exception $exception
     * @return void
     * @throws Exception
     */
    public function report(Exception $exception)
    {
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Exception $exception
     * @return \Illuminate\Http\Response
     * @throws Exception
     */
    public function render($request, Exception $exception)
    {
        /**
         * check if the request was an api request
         * this step just for returning json response
         * @author Amr
         */
//        dd($exception);
        if ($request->isJson() || $request->is('api/*')) {
            if ($exception instanceof RouteNotFoundException)
                return response()->api(ERROR_RESPONSE, trans('Auth::lang.not_authorized'), [], NOT_AUTHORIZED_ACCESS);
            else if ($exception instanceof ValidationException) {
                $errors = $exception->validator->errors();
                return response()->api(ERROR_RESPONSE, $errors->first(), prepare_error_attrs_keys($errors), VALIDATION_EXCEPTION);
            } else if ($exception instanceof ModelNotFoundException) {
                return response()->api(ERROR_RESPONSE, trans('lang.resource_not_found'), [], RESOURCE_NOT_FOUND);
            } else if ($exception instanceof AuthenticationException) {
                return response()->api(ERROR_RESPONSE, trans('Auth::lang.unauthenticated'), [], UNAUTHENTICATED_ERROR);
            }
            return response()->api(ERROR_RESPONSE, $exception->getMessage(), [], $exception->getCode());
        }


        return parent::render($request, $exception);
    }
}
