import js.d3.D3;
using js.d3.D3;

class Demo {
    public static function main(){

        var k = D3.select("#test").selectAll("div").data([1,2,3]).enter().append('div').text('heey');
        trace(Priority.important);
    }
	public static function bar(arr:Array<Dynamic>) {
		trace(arr);
	}
}
