$(document).ready(function(){
    $(".gallery_img").click(function(){
        var img_src=$(this).attr("src");
        var img_id=$(this).attr("id")
        $(".main").css("display","block");
        $(".image").css("display","block");
        $("#show_img").attr("src",img_src);
        
        $(".next").click(function(){
            if(img_id === 4)
            {
                img_id=1;
            }
            else
            {
                img_id++;
            }
            var new_img_id="#"+img_id;
            var new_img_src=$(new_img_id).attr("src");
           
            $("#show_img").attr("src",new_img_src)
        });
         $(".prev").click(function(){
            if(img_id === 1)
            {
                img_id=4;
            }
            else
            {
                img_id--;
            }
            var new_img_id="#"+img_id;
            var new_img_src=$(new_img_id).attr("src");
           
            $("#show_img").attr("src",new_img_src)
        });
    });
     $(".main").click(function(){
        $(".main").css("display","none");
        $(".image").css("display","none");
    });
});
