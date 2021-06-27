<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AuthorsProduct extends Model
{
    use HasFactory;

    protected $fillable = [
        'author_id',
        'product_id',
    ];
}
