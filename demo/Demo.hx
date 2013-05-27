import js.d3.D3;
class Demo {
    public static function main(){
        trace('hi');
        var s = [1,2,3];
        var k = D3.select("#test").selectAll("div")
        .data([1,2,3]).enter().append('div').text(function(){
            return 'hi';
        })
        .style("background-color","grey");
        untyped phantom.exit();
    }

}
