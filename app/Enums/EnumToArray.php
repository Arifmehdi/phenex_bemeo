<?php
namespace App\Enums;

trait EnumToArray
{
    /**
     * Get all enum names.
     */
    public static function getNames(): array
    {
        return array_map(fn($case) => $case->name, self::cases());
    }

    /**
     * Get all enum values.
     */
    public static function getValues(): array
    {
        return array_map(fn($case) => $case->value, self::cases());
    }

    /**
     * Get all enum names in uppercase.
     */
    public static function getNamesUppercase(): array
    {
        return array_map(fn($case) => strtoupper($case->name), self::cases());
    }

    /**
     * Get all enum values in uppercase.
     */
    public static function getValuesUppercase(): array
    {
        return array_map(fn($case) => strtoupper($case->value), self::cases());
    }

    /**
     * Get all enum names in PascalCase.
     */
    public static function getNamesPascalCase(): array
    {
        return array_map(fn($case) => ucfirst(strtolower($case->name)), self::cases());
    }

    /**
     * Get all enum values in PascalCase.
     */
    public static function getValuesPascalCase(): array
    {
        return array_map(function ($case) {
            $parts       = explode('_', strtolower($case->value));
            $pascalParts = array_map('ucfirst', $parts);
            return implode('', $pascalParts);
        }, self::cases());
    }

    /**
     * Get an associative array of enum values and names.
     */
    public static function getKeyValueMap(): array
    {
        return array_combine(self::getValues(), self::getNames());
    }

    /**
     * Get an associative array of enum values and names in PascalCase.
     */
    public static function getKeyValueMapPascalCase(): array
    {
        return array_combine(self::getValues(), self::getNamesPascalCase());
    }

    /**
     * Get an associative array of enum values and names in UPPERCASE.
     */
    public static function getKeyValueMapUppercase(): array
    {
        return array_combine(self::getValues(), self::getNamesUppercase());
    }

    /**
     * Check if a given name exists in the enum.
     */
    public static function hasName(string $name): bool
    {
        return in_array($name, self::getNames(), true);
    }

    /**
     * Check if a given value exists in the enum.
     */
    public static function hasValue(string $value): bool
    {
        return in_array($value, self::getValues(), true);
    }

    /**
     * Get an enum case by value.
     */
    public static function fromValue(string $value): ?self
    {
        foreach (self::cases() as $case) {
            if ($case->value === $value) {
                return $case;
            }
        }
        return null;
    }

    /**
     * Get an enum case by name.
     */
    public static function fromName(string $name): ?self
    {
        foreach (self::cases() as $case) {
            if ($case->name === $name) {
                return $case;
            }
        }
        return null;
    }

    /**
     * Get all enum names and values as a JSON string.
     */
    public static function toJson(): string
    {
        return json_encode(self::getKeyValueMap());
    }

    /**
     * Get a random enum case.
     */
    public static function getRandom(): self
    {
        return self::cases()[array_rand(self::cases())];
    }
}
