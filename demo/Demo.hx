import js.d3.D3;
using js.d3.D3;
using js.HTML5Array;
class Demo {
    public static function main(){
        var s = [1,2,3];
        var k = D3.select("#test").selectAll("div")
            .data([1,2,3]).enter().append('div').text(function(){
                return 'hi';
            });
    }
    public static function bar(arr:Array<Dynamic>) {
        trace(arr);
    }
}
