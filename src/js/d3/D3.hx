package js.d3;
import js.Dom;

@:native("d3")
extern class D3
{
	@:overload(function(selector:HtmlDom):UnboundSelection{})
	public static function select(selector:String):UnboundSelection;
	
	@:overload(function(selector:Array<HtmlDom>):UnboundSelection{})
	public static function selectAll(selector:String):UnboundSelection;
	
	public static var event:Event;
	
	/* sorting helpers */
	public static function ascending<T>(a:T, b:T):Int;
	public static function descending<T>(a:T, b:T):Int;

	/*	Array/Math Extensions*/
	public static function min(arr:Array<Dynamic>,?accessor:Dynamic->Dynamic):Dynamic;
	public static function max(arr:Array<Dynamic>,?accessor:Dynamic->Dynamic):Dynamic;
	public static function quantile(arr:Array<Float>,p:Float):Float;
	public static function bisectLeft(arr:Array<Dynamic>,x:Dynamic, ?lo:Dynamic, ?hi:Dynamic):Int;
	public static function bisect(arr:Array<Dynamic>,x:Dynamic, ?lo:Dynamic, ?hi:Dynamic):Int;			
	public static function bisectRight(arr:Array<Dynamic>,x:Dynamic, ?lo:Dynamic, ?hi:Dynamic):Int;
	public static function first<T>(arr:Array<T>, ?comparator:T->T->Int) : T;
	public static function last<T>(arr:Array<T>, ?comparator:T->T->Int) : T;
	/* Obj Extensions */
	public static function keys(obj:Dynamic):Array<String>;
	public static function values(obj:Dynamic):Array<String>;
	public static function entries(obj:Dynamic):Array<{key:String, value:Dynamic}>;
	
	/* Array/Op Extensions */
	public static function split<T>(arr:Array<T>, fn:T->Bool) : Array<Array<T>>;
	public static function merge<T>(arr:Array<Array<T>>):Array<T>;
	public static function range(?start:Float, stop:Float, ?step:Float) : Array<Float>;
	public static function permute<T>(arr:Array<T>, indexes:Array<Int>):Array<T>;
	public static function zip(arr1:Array<Dynamic>,arr2:Array<Dynamic>, arr3:Array<Dynamic>, arr3:Array<Dynamic>, arr4:Array<Dynamic>, arr5:Array<Dynamic>, arr6:Array<Dynamic>):Array<Array<Dynamic>>;
	
	/* Nests... TODO: does this work? */
	public static function nest():Nest<Dynamic,Dynamic>;
}



extern class Nest<A,B>{
	public function key<C>(fn:B->C):Nest<C,B>;
	public function sortKeys(fn:A->A->Int) : Nest<A,B>;
	public function sortValues(fn:B->B->Int) : Nest<A,B>;
	public function rollup<C>(fn:B->C):Nest<A,C>;
	public function map<T>(arr:Array<T>):Nest<A,T>;
	public function entries<T>(arr:Array<T>):Array<{key:A, values:Array<Dynamic>}>;
}


extern class Selection<T> extends BaseSelection{
	
	@:overload(function(name:String, value:String):Selection<T>{})  
	@:overload(function(name:String, value:Void->String):Selection<T>{})  
	@:overload(function(name:String, value:Dynamic->String):Selection<T>{})  
	@:overload(function(name:String, value:Dynamic->Int->String):Selection<T>{})  
	public function attr(name:String, value:String):Selection<T>;

	@:overload(function(name:String, value:String):Selection<T>{})  
	@:overload(function(name:String, value:Void->String):Selection<T>{})  
	@:overload(function(name:String, value:Dynamic->String):Selection<T>{})  
	@:overload(function(name:String, value:Dynamic->Int->String):Selection<T>{})  
	public function classed(name:String, value:String):Selection<T>;

	@:overload(function(name:String, value:String):Selection<T>{})  
	@:overload(function(name:String, value:Void->String):Selection<T>{})  
	@:overload(function(name:String, value:Dynamic->String):Selection<T>{})  
	@:overload(function(name:String, value:Dynamic->Int->String):Selection<T>{})  
	public function property(name:String, value:String):Selection<T>;

	@:overload(function(name:String, value:String, ?priority:String):Selection<T>{})  
	@:overload(function(name:String, value:Void->String, ?priority:String):Selection<T>{})  
	@:overload(function(name:String, value:Dynamic->String, ?priority:String):Selection<T>{})  
	@:overload(function(name:String, value:Dynamic->Int->String, ?priority:String):Selection<T>{})  
	public function style(name:String, value:String):Selection<T>;

	@:overload(function():String{})  
	@:overload(function(value:Void->String):Selection<T>{})  
	@:overload(function(value:Dynamic->String):Selection<T>{})  
	@:overload(function(value:Dynamic->Int->String):Selection<T>{})
	public function text(value:String) : Selection<T>;
	
	@:overload(function():String<T>{})  
	@:overload(function(value:Void->String):Selection<T>{})  
	@:overload(function(value:Dynamic->String):Selection<T>{})  
	@:overload(function(value:Dynamic->Int->String):Selection<T>{})
	public function html(value:String):Selection<T>;
	

	public function remove() : Selection<T>;
	
 
	@:overload(function<A>(?dataf:T->Array<A>):PreEnterSelection<A>{})	
	@:overload(function<A>(?dataf:T->Int->Array<A>):PreEnterSelection<A>{})
	@:overload(function(data:Array<A>,?key:A->Int->Dynamic):PreEnterSelection<A>{})  
	public function data<A>(data:Array<A>, ?key:A->Dynamic):PreEnterSelection<A>;
	
	@:overload(function(fn:T->Int->A):Selection<A>{})
	public function map<A>(fn:T->A):Selection<A>;
	
	public function sort(comparator:T->T->Int):Selection<T>;
	public function order():Selection<T>;	
	
	@:overload(function(type:String, listener:T->Int->Void):Selection<T>{})
	@:overload(function(type:String, listener:Void->Void):Selection<T>{})	
	public function on(type:String, listener:T->Void): Selection<T>;
	
	public function transition(): Selection<T>;
	
	public function select(selector:String):Selection<T>;
	public function selectAll(selector:String):Selection<T>;
	
	@:overload(function(fn:T->Int->Void):Selection<T>{})
	public function each(fn:T->Void):Selection<T>;
	
	@:overload(function(fn:Void->Dynamic):Selection<T>{})
	@:overload(function(fn:T->Int->Dynamic):Selection<T>{})
	public function call(fn:T->Dynamic) : Selection<T>;

	@:overload(function(selector:T->Int->Bool):Selection<T>{})
	@:overload(function(selector:T->Bool):Selection<T>{})
	public function filter(selector:String):Selection<T>;
}

extern class UnboundSelection extends BaseSelection{
	
	@:overload(function(name:String, value:String):UnboundSelection{})  
	@:overload(function(name:String, value:Void->String):UnboundSelection{})  
	@:overload(function(name:String, value:Dynamic->String):UnboundSelection{})  
	@:overload(function(name:String, value:Dynamic->Int->String):UnboundSelection{})  
	public function attr(name:String, value:String):UnboundSelection;

	@:overload(function(name:String, value:String):UnboundSelection{})  
	@:overload(function(name:String, value:Void->String):UnboundSelection{})  
	@:overload(function(name:String, value:Dynamic->String):UnboundSelection{})  
	@:overload(function(name:String, value:Dynamic->Int->String):UnboundSelection{})  
	public function classed(name:String, value:String):UnboundSelection;

	@:overload(function(name:String, value:String):UnboundSelection{})  
	@:overload(function(name:String, value:Void->String):UnboundSelection{})  
	@:overload(function(name:String, value:Dynamic->String):UnboundSelection{})  
	@:overload(function(name:String, value:Dynamic->Int->String):UnboundSelection{})  
	public function property(name:String, value:String):UnboundSelection;

	@:overload(function(name:String, value:Void->String, ?priority:Priority):UnboundSelection{})  
	@:overload(function(name:String, value:Dynamic->String, ?priority:Priority):UnboundSelection{})  
	@:overload(function(name:String, value:Dynamic->Int->String, ?priority:Priority):UnboundSelection{})  
	public function style(name:String, value:String, ?priority:Priority):UnboundSelection;

	@:overload(function():String{})  
	@:overload(function(value:Void->String):UnboundSelection{})  
	@:overload(function(value:Dynamic->String):UnboundSelection{})  
	@:overload(function(value:Dynamic->Int->String):UnboundSelection{})
	public function text(value:String) : UnboundSelection;
	
	@:overload(function():String<T>{})  
	@:overload(function(value:Void->String):UnboundSelection{})  
	@:overload(function(value:Dynamic->String):UnboundSelection{})  
	@:overload(function(value:Dynamic->Int->String):UnboundSelection{})
	public function html(value:String):UnboundSelection;
	
	public function append(name:String) : UnboundSelection;
	public function insert(name:String, ?before:String) : UnboundSelection;
	public function remove() : UnboundSelection;
	
	@:overload(function(data:Array<T>,?key:T->Int->Dynamic):PreEnterSelection<T>{})
	public function data<T>(data:Array<T>,?key:T->Dynamic):PreEnterSelection<T>;
	
	public function order():UnboundSelection;
	

	public function on(type:String, listener:Dynamic->Void): UnboundSelection;
	
	public function transition(): UnboundSelection;
	public function select(selector:String):UnboundSelection;
	public function selectAll(selector:String):UnboundSelection;

	@:overload(function(fn:Void->Dynamic):UnboundSelection{})	
	@:overload(function(fn:Dynamic->Int->Dynamic):UnboundSelection{})
	public function call(fn:Dynamic->Dynamic) : UnboundSelection;
	
}

extern class PreEnterSelection<T>{
	public function enter():EnterSelection<T>;
	public function exit():Selection<T>;
}

extern class EnterSelection<T>{
	public function append(name:String) : Selection<T>;
	public function insert(name:String, ?before:String) : Selection<T>;
}

extern class BaseSelection extends D3Array<HtmlDom>{
	public function empty():Bool;
	public function node():HtmlDom;	
}

extern enum Priority{
	important;	
}

class InitPriority{
	static var init = {untyped __js__('Priority = { important : "important"};');} 
}

extern class D3Array<T> implements ArrayAccess<T>{
	public function reverse():Void;
	public function shift():T;
	public function splice(index:Int, howMany:Int, ?opt1:T, ?opt2:T, ?opt3:T, ?opt4:T, ?opt5:T, ?opt6:T): D3Array<T>;
	public function unshift(arg:T,?opt1:T, ?opt2:T, ?opt3:T, ?opt4:T, ?opt5:T, ?arg6:T):Void;
	public function concat(arg:T,?opt1:T, ?opt2:T, ?opt3:T, ?opt4:T, ?opt5:T, ?arg6:T):D3Array<T>;
	public function join(separator:String):String;
	public function slice(begin:Int, ?end:Int):D3Array<T>;
	public function indexOf(searchElement:T, ?fromIndex:Int):Int;
	public function lastIndexOf(searchElement:T, ?fromIndex:Int):Int;
	public function forEach(cb:T->Dynamic, ?thisArg:Dynamic):Void;
	public function every(cb:T->Bool, ?thisObject:Dynamic):Bool;
	public function some(cb:T->Bool, ?thisObject:Dynamic):Bool;
	public function reduce<A>(cb:T->A->Int->D3Array<T>, ?initialValue:A):A;	
	public function reduceRight<A>(cb:T->A->Int->D3Array<T>, ?initialValue:A):A;
}

class D3ArrayCast{
	public static function array<T>(arr:D3Array<T>):Array<T>{
		return untyped arr;
	}
	public static function d3array<T>(arr:Array<T>):D3Array<T>{
		return untyped arr;
	}
}




