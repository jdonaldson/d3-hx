package js.d3;

@:native('d3.csv')
extern class Csv{
    @:native('d3.csv')
    public static function csv<T>(url:String, cb:Array<Dynamic<String>>->Dynamic):Void;
    public static function parseRows(text:String, cb:Text->Dynamic):Array<Array<String>>;
    public static function parse<T>(text:String):Array<Dynamic<T>>;
    public static function format(rows:Array<Array<String>>):String;
}
