if(typeof(CKEDITOR) != 'undefined')
{
 CKEDITOR.editorConfig = function(config) {
   config.uiColor = "#B3DE81";
   config.toolbar = [
    [ 'Bold', 'Italic', 'Underline' ],
    [ 'NumberedList', 'BulletedList' ],
    [ 'Undo', 'Redo' ],
    [ 'insertResolved' ]
 ];
}
} else{
  console.log("ckeditor not loaded")
}
