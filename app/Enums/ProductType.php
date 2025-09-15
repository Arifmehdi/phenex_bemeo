<?php

namespace App\Enums;

enum ProductType: string
{
    use EnumToArray;

    case SIMPLE = 'Simple';
    case VARIABLE = 'Variable';
}
