<script>
$(document).ready(function() {
    $.ajax({
        url: '/ticket/list',
        type: 'GET',
        xhrFields: {
            withCredentials: true
        },
        success: function(response) {
            if (response.status === 200) {
                let tickets = response.data.list;
                let hasStatusOrder1 = tickets.some(ticket => ticket.status.id === 1);
                let hasStatusOrder3 = tickets.some(ticket => ticket.status.id === 3);
                let hasStatusOrder5 = tickets.some(ticket => ticket.status.id === 5);
                
                if (hasStatusOrder1 || hasStatusOrder3 || hasStatusOrder5) {
                    $('#statusModal').modal('show');
                }
            } else {
                console.log('Failed to fetch tickets:', response.msg);
            }
        },
        error: function(error) {
            console.log('Error:', error);
        }
    });
});
</script>
{include file="includes/summernote" height="250"}
{include file="includes/markdown" height="250"}
<style>
   .was-validated .custom-control-input:valid ~ .custom-control-label::before{
    background-color: #fff;
  }
  .bootstrap-select.is-valid .dropdown-toggle, .was-validated .bootstrap-select select:valid+.dropdown-toggle{
      border: 1px solid #ced4da;
  }
    .biankuang{
    border: 1px solid #ced4da;
  }
  .form-control.is-valid, .was-validated .form-control:valid{
    display: block;
    width: 100%;
    padding: 0.47rem 0.75rem;
    font-size: 0.8125rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057; 
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiP…45NSwyLjI2LDYsMi4xMyw2LDJWMS41QzYsMS4yMiw1Ljc4LDEsNS41LDF6Ii8+Cjwvc3ZnPgo=);
    background-position-y: 50%;
    background-position-x: calc(100% - 11px);
    background-repeat: no-repeat;
    padding-right: 24px;
  }
  .yy-t-lh {
    line-height: 2em;
  }
</style>
<div class="card">
	<div class="card-body">
    
		<form method="post" class="needs-validation" novalidate enctype="multipart/form-data">
			<div class="row">
				<div class="col-sm-4 col-12">
					<div class="form-group">
						<label class="form-control-label" for="dptid">{$Lang.department}</label>
						<select class="form-control" id="dptid" name="dptid" onchange="window.location.href='submitticket?step=2&dptid='+$(this).val()">
							{foreach $SubmitTicket.department as $department}
							<option value="{$department.id}" {if $Think.get.dptid==$department.id}selected{/if}> {$department.name}
								</option> {/foreach} </select> </div> </div> <div class="col-sm-4 col-12">
								<div class="form-group">
									<label class="form-control-label" for="hostid">{$Lang.related_products}</label>
									<select class="form-control" id="hostid" name="hostid">
										{foreach $SubmitTicket.ticketpage.host_list as $key => $host}
										<option value="{$key}" {if $Think.get.pid==$key}selected{/if}>{$host} </option> {/foreach} </select>
											</div> </div> <div class="col-sm-4 col-12">
											<div class="form-group">
												<label class="form-control-label" for="priority">{$Lang.priority}</label>
												<select class="form-control" id="priority" name="priority">
													{foreach $SubmitTicket.ticketpage.priority as $key => $priority}
													<option value="{$key|strtolower}" {if $key=='Medium' }selected{/if}>{$priority} </option>
														{/foreach} </select> </div> </div> <div class="col-12">
														<div class="form-group">
															<label class="form-control-label" for="title">{$Lang.title}</label>
															<input type="text" class="form-control" id="title" name="title" value="{$Think.get.title}" required/>
														</div>
											</div>
											<div class="col-12">
												{foreach $ticketCustom as $k => $list}
													<div class="form-group">
														<label for="{$list.id}">{$list.fieldname}</label>
														{if $list.fieldtype == 'dropdown'}
															<!-- 下拉 -->
															<select name="customfield[{$list.id}]" class="form-control " {$list.required ? 'required' : ''}>
																{foreach $list.dropdown_option as $key => $val}
																	<option value="{$key}" {if(isset($_fields[$key]))} selected {/if}>{$val}</option>
																{/foreach}
															</select>
														{elseif $list.fieldtype == 'password'}
															<!-- 密码 -->
															<input name="customfield[{$list.id}]" type="password" {if(isset($_fields[$list['id']]))} value="{$_fields[$list['id']]}" {/if}class="form-control" placeholder="{$Lang.custom_password_box}" {$list.required ? 'required' : ''}/>
														{elseif $list.fieldtype == 'text' || $list.fieldtype == 'link'}
															<!-- 文本框、链接 -->
															<input name="customfield[{$list.id}]" type="text" class="form-control" {if(isset($_fields[$list['id']]))} value="{$_fields[$list['id']]}" {/if} placeholder="{$list.fieldname}" {$list.required ? 'required' : ''}/>
														{elseif $list.fieldtype == 'tickbox'}
                            
															<!-- 选项框 -->
                               							<div class="custom-control custom-switch mb-3" dir="ltr">
                                                        <input type="checkbox" class="custom-control-input" name="customfield[{$list.id}]" {if(isset($_fields[$list['id']]))} checked {/if} id="customSwitchsizesm" {$list.required ? 'required' : ''}>
                                                        <label class="custom-control-label" for="customSwitchsizesm"></label>
                                                    	</div>
															<!-- <input type="checkbox" class="custom-control-input" name="customfield[{$list.id}]" {if(isset($_fields[$list['id']]))} checked {/if}>{$list.fieldname} -->
														{elseif $list.fieldtype == 'textarea'}
															<!-- 文本域 -->
															<textarea name="customfield[{$list.id}]" cols="30" rows="10" class="form-control" {$list.required ? 'required' : ''}>{if(isset($_fields[$list['id']]))} {$_fields[$list['id']]} {/if}</textarea>
														{/if}
													</div>
												{/foreach}
											</div>
											<div class="col-12">
												<div class="form-group">
													<label class="form-control-label" for="content">{$Lang.content}</label>
													<textarea class="form-control" id="content" name="content" rows="10"
														placeholder="{$Lang.please_enter_question}" required></textarea>
													<!-- <textarea class="form-control markdown" id="content" name="content" rows="10"
														placeholder="请输入问题" required data-provide="markdown-editable"></textarea> -->
														<!-- <div class="markdown"></div> -->
												</div>
											</div>
											<div class="col-12">
												<div class="form-group">
													<label class="form-control-label col-form-label col-12">{$Lang.attachment}</label>
													<div class="row" id="filelist">
														<div class="col-12 mb-2 filebox d-flex justify-content-between">
															<input type="file" class="form-control-file fileWacth w-75" name="attachments[]">
															<a class="btn btn-danger deletefileBtn" style="display:none">{$Lang.delete}</a>
														</div>
													</div>
													<a class="btn btn-success mt-2" id="addFileBtn">{$Lang.add_more}</a>
												</div>
											</div>
											<div class="col-6 col-sm-3">
												<div class="form-group">
													<button type="submit" class="btn btn-primary btn-block submitBtn">
														<span>{$Lang.submit_work_order}</span>
													</button>
												</div>
											</div>
											<div class="col-6 col-sm-3">
												<div class="form-group">
													<a href="supporttickets" class="btn btn-block btn-light">{$Lang.cancel}</a>
												</div>
											</div>
								</div>

		</form>
	</div>
</div>
<div class="modal fade" data-backdrop="static" data-keyboard="false" id="statusModal" tabindex="-1" role="dialog" aria-labelledby="statusModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="statusModalLabel">已存在激活的工单</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <span class="yy-t-lh">当前已经存在激活的工单，<strong>请勿重复提交同类型工单。</strong></span>
       <span class="yy-t-lh">重复提交可能会导致处理延迟，我们会尽快处理您的问题，感谢您的理解。</span>
       <span class="yy-t-lh">如需提交其他工单请忽略本条提醒。</span> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">已知晓</button>
      </div>
    </div>
  </div>
</div>
<script>
  // Example starter JavaScript for disabling form submissions if there are invalid fields
  (function() {
    'use strict';
    window.addEventListener('load', function() {
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      var forms = document.getElementsByClassName('needs-validation');
      // Loop over them and prevent submission
      console.log(forms);
      var validation = Array.prototype.filter.call(forms, function(form) {
        
        form.addEventListener('submit', function(event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }else{
            // 提交按钮加载中
                // $("form").submit();
                $('.submitBtn').empty()
                $('.submitBtn').prepend(`<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>{$Lang.submit_work_order}`);
			  	$('.submitBtn').attr('disabled', true);
          }
      
          form.classList.add('was-validated');
        }, false);
      });
    },false);
  })();
  
  </script>
<script>
	$(function () {
		// 添加更多附件
		$('#addFileBtn').on('click', function () {
			var fileHtml = `
					<div class="col-12 mb-2 filebox d-flex justify-content-between">
						<input type="file" class="form-control-file fileWacth w-75" name="attachments[]">
								<a class="btn btn-danger deletefileBtn" style="display:none">删除</a>
					</div>
			`
			$('#filelist').append(fileHtml)
		});

		// 删除附件
		$('#filelist').on('click', '.deletefileBtn', function () {
			$(this).hide().parent('.filebox').remove()
		});
		$('#filelist').on('change','.fileWacth',function(){
          if($(this).prop('files').length){
			$(this).next().show()									
		  }
		})										
		
	})
</script>