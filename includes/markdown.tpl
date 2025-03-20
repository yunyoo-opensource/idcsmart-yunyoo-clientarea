<!-- markdown 存在的问题: class名称和项目名称冲突 导致工具栏字体图标无法显示 -->

<!-- <link href="/themes/clientarea/default/assets/libs/markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css">
<link href="/themes/clientarea/default/assets/libs/markdown/css/htmleaf-demo.css" rel="stylesheet" type="text/css">
<script src="/themes/clientarea/default/assets/libs/markdown/js/bootstrap-markdown.js"></script>
<script src="/themes/clientarea/default/assets/libs/markdown/locale/bootstrap-markdown.zh.js"></script>
<script>
  $(function () {
    $(".markdown").markdown({autofocus:false,savable:false, language:'zh'})
  })
</script> -->

<link href="/themes/clientarea/default/assets/libs/markdown-editor/dist/css/bootstrap-markdown-editor.css?v={$Ver}" rel="stylesheet" type="text/css">

<script src="/themes/clientarea/default/assets/libs/markdown-editor/js/ace.js?v={$Ver}"></script>
<script src="/themes/clientarea/default/assets/libs/markdown-editor/js/marked.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/default/assets/libs/markdown-editor/dist/js/bootstrap-markdown-editor.js?v={$Ver}"></script>
<script>
  $(function () {
    $(".markdown").markdownEditor({
      preview: true,
			onPreview: function (content, callback) {
				callback(marked(content));
			}
    })
  })
</script>