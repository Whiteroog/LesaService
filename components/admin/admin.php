<?php

class admin
{
    private static $names = "User2";

    public static function name_verify($input_name) {
        return self::$names === $input_name;
    }
}