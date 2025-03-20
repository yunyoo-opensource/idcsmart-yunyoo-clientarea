
<div class="container-fluid">
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                {if $TplName == 'viewbilling'}
                <h4 class="mb-0 font-size-18">{$Title} - {$Get.id}</h4>
                {else}
                <div style="display:flex;">
                    
                    <a href="javascript:history.go(-1)" class="backBtn" style="display: none;"><i class="bx bx-chevron-left" style="font-size: 32px;margin-top: 1px;color: #555b6d;"></i></a>
                    <h4 class="mb-0 font-size-18">{$Title}</h4>
                </div>
                {/if}
                <div class="page-title-right">
	                {if !$ShowBreadcrumb}
                    {include file="includes/breadcrumb"}
                    {/if}
                </div>

            </div>
        </div>
    </div>
    <!-- end page title -->    
</div>
<script>
    $(function(){
        $('.backBtn').hide()
    })
</script>