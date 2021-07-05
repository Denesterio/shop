<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subcategory extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'category_id',
        'slug'
    ];

    public function products()
    {
        return $this->hasMany(Product::class, 'slug', 'subcategory_slug');
    }
}
