<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Translatable\HasTranslations;
use Illuminate\Http\Request;

class Currency extends BaseModel
{
    use SoftDeletes, HasTranslations;
    public $translatable = ['name'];

    const FILLABLE = [
        'user_id', 'name', 'icon', 'is_active',
    ];

    protected $fillable = self::FILLABLE;

    protected $attributes = [
        'name' => '',
    ];

    protected $appends = ['locale_name'];

    protected $hidden = ['user_id', 'parent_id', 'created_at', 'updated_at', 'deleted_at'];


    /**
     * @return mixed
     */
    public function getLocaleNameAttribute()
    {
        $name = @$this->attributes['name'];
        //        dd($name);
        return ((array) json_decode($name))[app()->getLocale()];
    }

    /**
     * @param $q
     * @return mixed
     */
    public function scopeActive($q)
    {
        return $q->where('is_active', 1);
    }

    public function scopeFilter($q, Request $request)
    {
        return $q;
    }
    public static $columns = [
        [
            'label' => '#',
            'field' => 'id',
            'hidden' => true

        ],
        [
            'label' => 'name',
            'field' => 'name',
        ],
        [
            'label' => 'icon',
            'field' => 'icon',
        ],
        [
            'label' => 'Operations',
            'field' => 'actions',
            'html' => true,
        ]
    ];

    public static $actions = [
        [
            'slug' => 'edit',
            'route' => 'currencies.edit',
            'params' => [
                'currencies_id' => 'id'
            ]
        ],
        [
            'slug' => 'delete',
            'route' => 'settings.currencies.delete'
        ]
    ];
}
