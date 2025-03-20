
{if $ErrorMsg}
<script>
$(function () {
  toastr.error('{$ErrorMsg}');
});
</script>
{else /}

    {if $Action == "upgrade_configoption_page"}
					{foreach $UpgradeConfig.host_config_options as $host_config}
						<div class="form-group row configureproduct" style="display:none;">   
							<label class="btn btn-primary btn-sm active">
								<input id="config{$host_config.configid}_{$host_config.optionid}" type="radio" checked="" name="configoption[{$host_config.configid}]"  value="{if $host_config.qty>0}{$host_config.qty}{else/}{$host_config.optionid}{/if}" >
							</label>
                        </div>      
                    {/foreach}
                    <form data-class="configoption_form" class="configoption_form">
                        
						{foreach $UpgradeConfig.host as $option}
                        {if $option.option_type==1}
                          <div class="form-group row configureproduct">
                            <label for="example-search-input" class="col-md-2 col-form-label">{$option.option_name}
                            </label>
                            <div class="col-md-3">										
                              <select id="config{$option.oid}" name="configoption[{$option.oid}]" class="form-control selectpicker" data-style="btn-default">
                                {foreach $option.sub as $sub}
                                <option id="sub{$sub.id}" {if $option.subid==$sub.id} selected="" {/if} value="{$sub.id}">{$sub.option_name}</option>
                                {/foreach}
                              </select>
                            </div>
                          </div>
                          {elseif $option.option_type==2 /}
                          <div class="form-group row configureproduct">   
                            <label for="example-search-input" class="col-md-2 col-form-label">{$option.option_name}</label> 
                            <div class="col-md-10"> 
                              {foreach $option.sub as $sub_key=>$sub_val}
                              <div class="form-check mb-3">
                                <input id="config{$option.oid}_{$sub_val.id}" type="radio" name="configoption[{$option.oid}]" value="{$sub_val.id}" class="form-check-input" {if $option.subid==$sub_val.id}checked=""{/if}>
                                <label class="form-check-label" for="config{$option.oid}_{$sub_val.id}">{$sub_val.option_name}</label>
                                </div>
                              {/foreach}								
                            </div>              
                          </div>
                          {elseif $option.option_type==3 /}
                          <div class="form-group row configureproduct">   
                            <label for="example-search-input" class="col-md-2 col-form-label">{$option.option_name}</label> 
                            <div class="col-md-10"> 
                              {foreach $option.sub as $sub_key=>$sub_val}
                              <div class="custom-control custom-checkbox mb-3">
                                <input id="config{$option.oid}_{$sub_val.id}" type="checkbox" name="configoption[{$option.oid}]" class="custom-control-input" {if $option.subid==$sub_val.id} checked="" {/if}  value="{$sub_val.id}">
                                <label class="custom-control-label" for="config{$option.oid}_{$sub_val.id}">{$sub_val.option_name}</label>
                              </div>
                              {/foreach}	
                            </div>              
                          </div>
                          {elseif $option.option_type==4 || $option.option_type==7 || $option.option_type==9 || $option.option_type==11 || $option.option_type==14 || $option.option_type==15 || $option.option_type==16 || $option.option_type==17 || $option.option_type==18 || $option.option_type==19  /}
                          <div class="form-group row configureproduct">
                            <label for="example-search-input" class="col-md-2 col-form-label">{$option.option_name}</label>
                            <div class="col-md-10 d-flex align-items-center" style="padding:0px">
                              <!-- <input type="range" min="{$option.qty_minimum}" max="{$option.qty_maximum}" value="{$option.qty}" data-sub='{:json_encode($option.sub)}'  class="form-control-range configoption_range"> -->
                              <input type="range" min="{$option.qty_minimum}" max="{$option.qty_maximum}" qty_stage="{$option.qty_stage == 0 ? 1 : $option.qty_stage}" value="{$option.qty}" data-sub='{:json_encode($option.sub)}'  class="form-control-range configoption_range float-left mr-2"  style="width: 80%;">
                              <input id="config{$option.oid}" data-type="number" class="col-md-1 form-control form-control-sm configoption_range_val" name="configoption[{$option.oid}]"  onblur="numberKeyup(this)" type="text" min="{$option.qty_minimum}" max="{$option.qty_maximum}" qty_stage="{$option.qty_stage == 0 ? 1 : $option.qty_stage}"  value="{$option.qty}" >
                              <span>{$option.unit}</span>
                                <!--{if $option.option_type == '4' || $option.option_type == '15'}
                                <span>个</span>
                              {elseif $option.option_type == '7' || $option.option_type == '16'}
                                <span>核</span>
                              {elseif $option.option_type == '9' || $option.option_type == '17'}
                                <span>GB</span>
                              {elseif $option.option_type == '11' || $option.option_type == '18'}
                                <span>Mbps</span>
                              {elseif $option.option_type == '14' || $option.option_type == '19'}
                                <span>GB</span>
                              {/if}-->
                            </div>
                          </div>
                          {elseif $option.option_type==6 || $option.option_type==8 || $option.option_type==10 || $option.option_type==13 /}
                          <div class="form-group row configureproduct">   
                            <label for="example-search-input" class="col-md-2 col-form-label">{$option.option_name}</label> 
                            <div class="col-md-10"> 
                              <div class="btn-group btn-group-toggle mt-2 mt-xl-0" data-toggle="buttons">
                                {foreach $option.sub as $sub_key=>$sub_val}
                                <label class="btn btn-primary btn-sm {if $option.subid==$sub_val.id}active{/if}">
                                  <input id="config{$option.oid}_{$sub_val.id}" type="radio" {if $option.subid==$sub_val.id}checked="" {/if} name="configoption[{$option.oid}]"  value="{$sub_val.id}" > {$sub_val.option_name}
                                </label>
                                {/foreach}	
                              </div>
                            </div>              
                          </div>

                        {elseif $option.option_type==20 /}

                            <div class="form-group row configureproduct lingAge-{$option.id}">
                                <label for="example-search-input" class="col-md-2 col-form-label">{$option.option_name}
                                    {if $option.notes}
                                        <span data-toggle="tooltip" data-placement="right" title="{$option.notes}">
									<i class="bx bxs-help-circle pointer text-primary"></i>
								</span>
                                    {/if}
                                </label>
                                <div class="col-md-10">
                                    <div class="btn-group btn-group-toggle mt-2 mt-xl-0" data-toggle="buttons">
                                        {foreach $option.sub as $sub_key=>$sub_val}
                                            <label class="btn btn-primary btn-sm {if $option.subid==$sub_val.id}active{/if}">
                                                <input id="config{$option.id}_{$sub_val.id}" type="radio" data-optionid="{$option.id}"
                                                       data-subid="{$sub_val.id}" name="configoption[{$option.id}]" value="{$sub_val.id}"
                                                       class="form-check-input" {if $option.subid==$sub_val.id}checked{/if}> {$sub_val.option_name}
                                            </label>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                            <div class="lingAge-{$option.id}-son">
                                {if (isset($option.son) && $option.son)}
                                    {foreach $option.son as $son_k1 => $son_v1}
                                        <div class="form-group row configureproduct">
                                            <label for="example-search-input" class="col-md-2 col-form-label">{$son_v1.option_name}
                                                {if $son_v1.notes}
                                                    <span data-toggle="tooltip" data-placement="right" title="{$son_v1.notes}">
										<i class="bx bxs-help-circle pointer text-primary"></i>
									</span>
                                                {/if}
                                            </label>
                                            <div class="col-md-10">
                                                <div class="btn-group btn-group-toggle mt-2 mt-xl-0" data-toggle="buttons">
                                                    {foreach $son_v1.sub as $sub_key=>$sub_val}
                                                    <label class="btn btn-primary btn-sm {if $son_v1.subid==$sub_val.id}active{/if}">
                                                            <input id="config{$son_v1.id}_{$sub_val.id}" type="radio" data-optionid="{$option.id}"
                                                                   data-subid="{$sub_val.id}" name="configoption[{$son_v1.id}]" value="{$sub_val.id}"
                                                                   class="form-check-input" {if $son_v1.subid==$sub_val.id} checked {/if}> {$sub_val.option_name}
                                                    </label>
                                                    {/foreach}
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                {/if}
                            </div>
                          {/if}
                        {/foreach}


                        <input type="hidden" name="pid" value="{$UpgradeConfig.pid}">
                    </form>
                   <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light submit">{$Lang.upgrade_next_step}</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">{$Lang.return}</button>
                  </div>




    <script>
		var UpgradeConfigStepOne=$('#modalUpgradeConfigStepOne form').serialize();
        $('#modalUpgradeConfigStepOne .submit').on('click', function(){
			if($('#modalUpgradeConfigStepOne form').serialize()==UpgradeConfigStepOne) return false;
            if(!$(this).data('submit')){
                $(this).data('submit', 1);
				$(this).prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>')
                let _this = $(this);
                $.ajax({
                    url: "/servicedetail?id={$Think.get.id}&action=upgrade_config",
                    type: 'POST',
                    data: $('#modalUpgradeConfigStepOne form').serialize() + '&action=upgrade_config',
                    success: function(res){
                        if(res.indexOf('modalUpgradeConfigStepTwo') > -1){
                            $('#modalUpgradeConfigStepOne').modal('hide')
                            $('.modal-backdrop.fade.show').remove()

                            if($('#modalUpgradeConfigStepTwoDiv').length == 0){
                                $("#upgradeConfigDiv").after('<div id="modalUpgradeConfigStepTwoDiv"></div>');
                            }
                            $('#modalUpgradeConfigStepTwoDiv').html(res);

                            //$("#upgradeConfigDiv").html(res);
                            $('#modalUpgradeConfigStepTwo').modal("show");
                        }else if(res.indexOf('<script>') === 0){
                            $("#upgradeConfigDiv").append(res);
                        }
                        _this.removeData('submit')
						_this.html("{$Lang.upgrade_next_step}");
                    },
                    error: function(){
                        _this.removeData('submit')
						_this.html("{$Lang.upgrade_next_step}");
                    }
                })
            }
        })

        function numberBlur(min, max, _this)
        {
            var num = $(_this).val();

            if(num >= min && num <= max)
            {
                return true;
            }

            if(num < min)
            {
                $(_this).val(min);
                return true;
            }
            if(num > min)
            {
                $(_this).val(max);
                return true;
            }
        }

        //单选
        $(document).on('click', ".configoption_form input[type='radio'],.configoption_form input[type='checkbox'],.configoption_form input[type='radio']", function () {
            var cid = $(this).data('optionid')
                , sub_id = $(this).data('subid')
                , pid = $('input[name="pid"]').val();
            var data = { cid: cid, sub_id: sub_id, pid: pid }
            if (cid) {
                $.ajax({
                    url: '/getLinkAgeList'
                    , data: data
                    , dataType: 'json'
                    , type: 'get'
                    , success: function (e) {
                        if (e.status != 200) {
                            toastr.error('配置项错误');
                            return false;
                        }
                        appendLinkAge(data, e);
                    }
                })
                // return false;
            }

        })

        function appendLinkAge (data, e) {
            var son = e.data[0].son;
            var html = '';
            for (var i in son) {
                html += '<div class="form-group row configureproduct">'
                    + '<label for="example-search-input" class="col-md-2 col-form-label">' + son[i].option_name;
                if (son[i].notes) {
                    html += '<span data-toggle="tooltip" data-placement="right" title="' + son[i].notes + '">\n' +
                        '<i class="bx bxs-help-circle pointer text-primary"></i>\n' +
                        '</span>';
                }
                html += '</label> <div class="col-md-10"><div class="btn-group btn-group-toggle mt-2 mt-xl-0" data-toggle="buttons">'

                for (var j in son[i].sub) {
                    var label_check = son[i].checkSubId == son[i].sub[j].id ? 'active' : '';
                    html += '<label class="btn btn-primary btn-sm '+ label_check +'">' +
                        '<input id="config' + son[i].id + '_' + son[i].sub[j].id + '" type="radio" data-optionid="' + data.cid + '" data-subid="' + son[i].sub[j].id + '" name="configoption[' + son[i].id + ']"\n' +
                        '  value="' + son[i].sub[j].id + '" class="form-check-input"';
                    if (son[i].checkSubId == son[i].sub[j].id) {
                        html += ' checked=""';
                    }
                    html += '>' + son[i].sub[j].option_name + '</label>';
                }
                html += '</div> </div></div>'
            }
            $('.lingAge-' + data.cid + '-son').html(html);
        }
    </script>


<link rel="stylesheet" href="/themes/clientarea/default/assets/libs/bootstrap-select/css/bootstrap-select.min.css?v={$Ver}">
<script src="/themes/clientarea/default/assets/libs/bootstrap-select/js/bootstrap-select.min.js?v={$Ver}"></script>
<script>
var links={:json_encode($UpgradeConfig.links)};
$('.selectpicker').selectpicker();
//下拉
$("form[data-class=\"configoption_form\"] select").change(function(){
	configoption_ajax();
})
//单选
$('form[data-class="configoption_form"] input[type="radio"],form[data-class="configoption_form"] input[type="checkbox"]').click(function(){
    configoption_ajax();
})
$(".configoption_range").mousedown(function(){
	$(this).data("active",true);
});
$(".configoption_range").mousemove(function(){
	rangeChange($(this));
	$(this).removeData("active");
	configoption_ajax();
});
var range = 0;
var dataSub;
var sectionShow;
function rangeNum(val,min,max,qty_stage){
    sectionShow = false;
    if(val%qty_stage == 0 || val == min || val == max) {
        dataSub.map(item => {
            if(val >= item.qty_minimum && val<=item.qty_maximum) {
                sectionShow = true;
            }
        })
        if(sectionShow) {
            range = val;
            return
        } else {
            val++;
            rangeNum(val,min,max,qty_stage)
        }
    } else {
        val++;
        rangeNum(val,min,max,qty_stage)
    }
}
function rangeChange(_this) {
    let qty_stage = parseInt($(_this).attr('qty_stage'));
    let minNum = parseInt($(_this).attr('min'));
    let maxNum = parseInt($(_this).attr('max'));
    dataSub = JSON.parse($(_this).attr('data-sub'));
	//if($(_this).data("active")){
		range = $(_this).val();
        rangeNum(parseInt(range),parseInt(minNum),parseInt(maxNum),parseInt(qty_stage));
        // if (range_sub($(_this), range)) {
        //     $(_this).siblings(".configoption_range_val").val(range);		
        // } else {
        //     // $(_this).val($(_this).siblings(".configoption_range_val").val());
        //     $(_this).val(range);
        // }
        $(_this).siblings(".configoption_range_val").val(range);		
        $(_this).val(range);
        $(_this).siblings('.range_none').each(function(){
            if(parseFloat($(this).attr('title')) < parseFloat(range)) {
                $(this).hide();
            } else {
                $(this).show();
            }
        })
        let blNum = (parseInt(range) - parseInt(minNum)) / (parseInt(maxNum) - parseInt(minNum)) * 100
        $(_this).css( 'background', 'linear-gradient(to right, #2948df, #F1F3F8 ' + blNum + '%, #F1F3F8)' );
	//}
}
// 移动端滑动
$(".main-content").on("touchend",".configoption_range", function(e) {
    rangeChange(this)
})
$(".main-content").on("touchmove",".configoption_range", function(e) {
    rangeChange(this)
 })

// $(document).on('click',':not(.configoption_range_val)',function(){
// 	$(".configoption_range_val").each(function (i) {
//         console.log($(this),$(this).data("active"))
// 		if($(this).data("active")){
// 			$(this).removeData("active");
// 			numberKeyup2($(this));
// 		}	
// 	})
// })

function numberKeyup(_this) {
	$(_this).data("active",true);

    const min = $(_this).attr("min"),
    max = $(_this).attr("max"),
    val = $(_this).val();
    console.log(val,typeof(val),min,typeof(min),max)

    if(parseFloat(val)>parseFloat(max)){
        
        $(_this).val(parseFloat(max))
    }
    if(parseFloat(val)<parseFloat(min)){
        $(_this).val(parseFloat(min))
    }


    $(".configoption_range_val").each(function (i) {
        console.log($(this),$(this).data("active"))
		if($(this).data("active")){
			$(this).removeData("active");
			numberKeyup2($(this));
		}	
	})
}
function numberKeyup2(_this) {
    //输入
    _this.val(_this.val().replace(/[^\d]/g, ''));
    var min = _this.attr("min");
    var max = _this.attr("max");
    var val = (min != "") ? (min) : "0";
    if (_this.val() == "") _this.val(val);
    var number = _this.val();
    if (range_sub(_this.siblings(".configoption_range"), number)) {
        _this.siblings(".configoption_range").val(number);

    } else {
        _this.val(_this.siblings(".configoption_range").val());
        number = _this.siblings(".configoption_range").val()
    }
    let blNum = (parseInt(_this.val()) - parseInt(min)) / (parseInt(max) - parseInt(min)) * 100
    _this.siblings(".configoption_range").css( 'background', 'linear-gradient(to right, #2948df, #F1F3F8 ' + blNum + '%, #F1F3F8)' );
    if($(_this).val()%$(_this).attr('qty_stage')!=0 && $(_this).val() != $(_this).attr('min') && $(_this).val() != $(_this).attr('max')) {
        toastr.error(`请输入${$(_this).attr('qty_stage')}的倍数`);
        _this.val($(_this).attr('min'));
        _this.siblings(".configoption_range").css('background','#ebeff4').val($(_this).attr('min'));
    }
    _this.siblings('.range_none').each(function(){
        if(parseFloat($(this).attr('title')) < parseFloat(number)) {
            $(this).hide();
        } else {
            $(this).show();
        }
    })
    configoption_ajax();
}

//滑块
function range_sub (range, val) {
    var sub = range.data("sub");
    var range_v = 0, range_i;
    $.each(sub, function (i, v) {
        range_i = i + 1;
        if (v.qty_minimum > val || v.qty_maximum < val) range_v += 1;
    })
    if (range_i == range_v) return false;
    return true;
}
config_options_links();
function configoption_ajax(){
	
	config_options_links();//对前面匹配的再次匹配，防止无效的条件判断。
	$('.selectpicker').selectpicker("refresh");
}
window.onload=function(){
	configoption_ajax();
}

//高级配置项
function config_options_links () {
    if (!links) return false;
    clear_disabled();
	var config_result_array={};var key_num=0;
    $.each(links, function (key, val) {
        //条件
        var configcondition = config_condition(val);
        
        // console.log(val.result);
        //结果
        if (configcondition) {
			$.each(val.result, function (result_key, result_val) {
				var val_config={},sneq={},seq={},config_result_json={};
				if(config_result_array[result_val.config_id]==undefined) config_result_array[result_val.config_id]={};
				else config_result_json=config_result_array[result_val.config_id];
				//console.log(config_result_json);
				val_config['config_id']=result_val.config_id;							
				val_config['sneq']=config_result_json.sneq;
				val_config['seq']=config_result_json.seq;
				if(result_val.relation=="sneq"){
					if(!config_result_json.hasOwnProperty('sneq')){	
						sneq=result_val.sub_id;
					}else{
						$.each(config_result_json.sneq, function (seq_key, seq_val) {
							sneq[seq_key]=seq_val;
						});
						$.each(result_val.sub_id, function (seq_key, seq_val) {
							sneq[seq_key]=seq_val;
						});
					}
					val_config['sneq']=sneq;
				}else if(result_val.relation=="seq"){
					if(!config_result_json.hasOwnProperty('seq')){		
						seq=result_val.sub_id;
					}else{
						$.each(config_result_json.seq, function (seq_key, seq_val) {
							seq[seq_key]=seq_val;
						});
						$.each(result_val.sub_id, function (seq_key, seq_val) {
							seq[seq_key]=seq_val;
						});						
					}
					val_config['seq']=seq;
				}							
				config_result_array[result_val.config_id]=val_config;
				
			});
			//console.log(val.result);
            //config_result(val.result);
        }
		
    });
	$.each(config_result_array, function (key, val) {
		var seq_sub_id={},result={},result_v={};
		if(val.seq && val.sneq){			
			$.each(val.seq, function (seq_key, seq_val) {
				$.each(val.sneq, function (sneq_key, sneq_val) {
					if(sneq_key!=seq_key){
						seq_sub_id[seq_key]=seq_val;
					}
				})
				
			})
			result_v['config_id']=val.config_id;
			result_v['relation']="seq";
			result_v['sub_id']=seq_sub_id;
		}else if(val.seq){
			result_v['config_id']=val.config_id;
			result_v['relation']="seq";
			result_v['sub_id']=val.seq;			
		}else if(val.sneq){
			result_v['config_id']=val.config_id;
			result_v['relation']="sneq";
			result_v['sub_id']=val.sneq;
		}
		result[0]=result_v;
		config_result(result);
		//console.log(result);
    });
	
	//console.log(config_result_array);
	
}
//清除disabled
function clear_disabled () {
    $(".configureproduct input").parent().removeClass("disabled");
    $(".configureproduct input").removeAttr("disabled");
    $(".configureproduct select option").removeAttr("disabled");
    $(".configureproduct select").removeClass("disabled");
}
//判断条件是否成立
function config_condition (condition) {
    var _condition = false, _condition2 = true;
    if (condition.relation == "seq") {
        $.each(condition.sub_id, function (sub_key, sub_val) {
            if ($("#config" + condition.config_id).length > 0) {
                conditionTagName = $("#config" + condition.config_id)[0].tagName.toLowerCase();
                if (conditionTagName == "select" && $("#config" + condition.config_id).val() == sub_key) {
                    _condition = true;
                } else if (conditionTagName == "input" && $("#config" + condition.config_id).val() >= sub_val.qty_minimum && $("#config" + condition.config_id).val() <= sub_val.qty_maximum) {
                    _condition = true;
                }

            } else if ($("#config" + condition.config_id + "_" + sub_key).length > 0) {
                if ($("#config" + condition.config_id + "_" + sub_key + ":checked").val() == sub_key) {
                    _condition = true;
                }
            }
        });
    } else if (condition.relation == "sneq") {
        $.each(condition.sub_id, function (sub_key, sub_val) {
            if ($("#config" + condition.config_id).length > 0) {
                conditionTagName = $("#config" + condition.config_id)[0].tagName.toLowerCase();
                if (conditionTagName == "select") {
					if($("#config" + condition.config_id).val() != sub_key){
						_condition = true; 
					}else{
						_condition2=false;
					}
                } else if (conditionTagName == "input") {
                    if($("#config" + condition.config_id).val() <= sub_val.qty_minimum || $("#config" + condition.config_id).val() >= sub_val.qty_maximum){
						_condition = true; 
					}else{
						_condition2=false;
					}
                }

            } else if ($("#config" + condition.config_id + "_" + sub_key).length > 0) {
                if ($("#config" + condition.config_id + "_" + sub_key + ":checked").val() != sub_key) {
                    _condition = true;
                }else{
					_condition2=false;
				}
            }
            //console.log($("#config"+condition.config_id).val());
            //console.log(sub_key);
        });
        //_condition=false;
    }
	if(_condition2==false) return _condition2;
    return _condition;
}
//结果
function config_result(result){ 
	$.each(result,function(result_key,result_val){
		var       configoption=$("input[name='configoption["+result_val.config_id+"]']");//匹配的数据绑定的标签

        //console.log(result_val);
        var conditionConfig = "#config" + result_val.config_id;
        if ($(conditionConfig).length > 0) {
            //console.log($(conditionConfig).length);
            conditionTagName = $(conditionConfig)[0].tagName.toLowerCase();
            if (result_val.relation == "seq") {
                if (conditionTagName == "select") {
					var selected_val=$(conditionConfig).val();
                    $(conditionConfig).find("option").attr("disabled", "disabled");
                } else if (conditionTagName == "input") {
                    $(conditionConfig).attr("disabled", "disabled");
                    $(conditionConfig).parent().addClass("disabled");
                }
            } else {
                if (conditionTagName == "select") {
					var selected_val=$(conditionConfig).val();
                    $(conditionConfig).find("option").removeAttr("disabled");
                } else if (conditionTagName == "input") {
                    $(conditionConfig).removeAttr("disabled");
                    $(conditionConfig).parent().removeClass("disabled");
				}
			}

		}else{
			if(result_val.relation=="seq"){
				configoption.attr("disabled","disabled");
                configoption.parent().addClass("disabled");
			}else if( result_val.relation=="sneq"){
				configoption.removeAttr("disabled");
                configoption.parent().removeClass("disabled");
			}
		}
		var subSeq=[],subSeqChecked=false,subSneq=[],subSneqChecked=false,
		subSeqNumber=[],subSeqNum=false,subSeqQtyMin;
		var count=Object.keys(result_val.sub_id).length,num=0;
		$.each(result_val.sub_id,function(key,val){
			var conditionConfigId=conditionConfig+"_"+key;
			
			if($(conditionConfig).length > 0){
			//配置项ID
				condition_subid=Number($(conditionConfig).val());
				
				if(result_val.relation=="seq"){
				//匹配的数据相等 除了相等的值，其它禁选择
					
					if($(conditionConfig).data("type")=="number"){
					//数字类型
						$(conditionConfig).removeAttr("disabled");
                        $(conditionConfig).parent().removeClass("disabled");
                        if (!subSeqQtyMin) subSeqQtyMin = val.qty_minimum;
                        if (condition_subid < val.qty_minimum || condition_subid > val.qty_maximum) {
                            num++;
                            if (count == num) {
                                number = subSeqQtyMin;
                                $(conditionConfig).val(number);
                                $(conditionConfig).siblings(".configoption_range").val(number);
                            }
                            //console.log("count:"+count);
                            //console.log("num:"+num);
                        }
                    } else {
                        $(conditionConfig).find("#sub" + key).removeAttr("disabled");
                        //$(conditionConfig).find("#sub" + key).prop("selected", false);
                        //if ($(conditionConfig).is(":selected")) subSneqChecked = true;
						if (selected_val==$("#sub" + key).val()) subSeqChecked = true;
                        subSeq[key] = conditionConfig;
                    }
                } else if (result_val.relation == "sneq") {
                    //匹配的数据不相等 相等的值禁选择
                    if ($(conditionConfig).data("type") == "number") {
                        //数字类型

                    } else {
                        $(conditionConfig).find("#sub" + key).attr("disabled", "disabled");
                        //$(conditionConfig).find("#sub" + key).prop("selected", false);
                        //if ($(conditionConfig).is(":selected")) subSeqChecked = true;
						if (selected_val==$("#sub" + key).val()) subSneqChecked = true;
                        subSneq[key] = conditionConfig;
                    }

                }
            } else if ($(conditionConfigId).length > 0) {
                //配置项配置ID
                if (result_val.relation == "seq") {
                    //匹配的数据相等
                    subSeq[key] = conditionConfigId;
                    if ($(conditionConfigId).is(":checked")) subSeqChecked = true;
                    $(conditionConfigId).removeAttr("disabled");
                    $(conditionConfigId).parent().removeClass("disabled");
				}else if( result_val.relation=="sneq"){
					subSneq[key]=conditionConfigId;
					if($(conditionConfigId).is(":checked")) subSneqChecked=true;
					//匹配的数据不相等 相等的值禁选择							
					$(conditionConfigId).attr("disabled","disabled");
                    $(conditionConfigId).parent().addClass("disabled");
					$(conditionConfigId).prop("checked",false);
					$(conditionConfigId).parent().removeClass("active");
				}
			}
			
		});
		var checkedSubSeq=false,checkedSnubSeq=false;
		if($(conditionConfig).length > 0){
		//conditionConfig 类型结果判断
			$.each($(conditionConfig).find("option"),function(){
				if(subSeq.length>0){
					//console.log(subSeq);
					if($(this).attr("disabled")){
						$(this).prop("selected",false);						
					}else if(!checkedSubSeq && subSeq[$(this).val()] && !subSeqChecked){					
						$(this).prop("selected",true);						
						checkedSubSeq=true;
					} 
				}else if(subSneq.length>0){					
					if($(this).attr("disabled")){
						$(this).prop("selected",false);						
					}else if(!checkedSnubSeq  && subSneqChecked){
						$(this).prop("selected",true);						
						checkedSnubSeq=true;
					}
				}
				
			});
		}else{
		//conditionConfigId 类型结果判断
			$.each(configoption,function(i,v){
				if(subSeq.length>0){					
					//console.log(subSeq);
					if($(this).attr("disabled")){
						//console.log($(this).val());
						$(this).prop("checked",false);
						$(this).parent().removeClass("active");
					}else if(!checkedSubSeq && subSeq[$(this).val()] && !subSeqChecked){					
						$(this).prop("checked",true);							
						$(this).parent().addClass("active");
						checkedSubSeq=true;
					} 
				}else if(subSneq.length>0){
					
					if($(this).attr("disabled")){
						$(this).prop("checked",false);
						$(this).parent().removeClass("active");
					}else if(!checkedSnubSeq  && subSneqChecked){
						$(this).prop("checked",true);
						$(this).parent().addClass("active");
						checkedSnubSeq=true;
					}
				}
				
			});
		}
	});
}
</script>

    
    {else /}
    <div class="modal fade" id="modalUpgradeConfigStepTwo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered " style="min-width: 42%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title mt-0" id="myLargeModalLabel">{$Lang.upgrade_settlement}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <input type="hidden" value="{$Token}" style="display: none;" />

                        <div class="table-responsive">
                            <table class="table table-centered mb-0 table-nowrap">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">{$Lang.upgrade_original_configuration}</th>
                                        <th scope="col">{$Lang.price}</th>
                                        <th scope="col">{$Lang.upgrade_after_discount}</th>
                                        <th scope="col"></th>
                                        <th scope="col">{$Lang.upgrade_new_configuration}</th>
                                        <th scope="col">{$Lang.price}</th>
                                        <th scope="col">{$Lang.upgrade_after_discount}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $UpgradeConfig.alloption as $item}
                                    <tr>
                                        <td scope="row">
                                            <h5 class="font-size-14 text-truncate" style="position: relative;">{$item.option_name}:{if $item.option_type==4 || $item.option_type==7 || $item.option_type==9 || $item.option_type==11 || $item.option_type==14 || $item.option_type==15 || $item.option_type==16 || $item.option_type==17 || $item.option_type==18 || $item.option_type==19} {$item.old_qty} {else/}{$item.old_suboption_name}{/if}</h5>
                                        </td>
                                        <td>
                                            <h5 class="font-size-14 text-truncate" style="position: relative;">{$item.old_sub_pricing_base}</h5>
                                        </td>
                                        <td>
                                            <h5 class="font-size-14 text-truncate" style="position: relative;">{$item.old_sub_pricing}</h5>
                                        </td>
                                        <td>
                                            <img style="width:16px; right:20%;margin-top: -10px;" src="/themes/clientarea/default/assets/images/left-icon.png" />
                                        </td>
                                        <td>
                                            <h5 class="font-size-14 text-truncate">{$item.option_name}:{if $item.option_type==4 || $item.option_type==7 || $item.option_type==9 || $item.option_type==11 || $item.option_type==14 || $item.option_type==15 || $item.option_type==16 || $item.option_type==17 || $item.option_type==18 || $item.option_type==19} {$item.qty} {else/}{$item.suboption_name}{/if}</h5>
                                        </td>
                                        <td>
                                            <h5 class="font-size-14 text-truncate" style="position: relative;">{$item.new_sub_pricing_base}</h5>
                                        </td>
                                        <td>
                                            <h5 class="font-size-14 text-truncate" style="position: relative;">{$item.new_sub_pricing}</h5>
                                        </td>
                                        
                                    </tr>
                                    {/foreach}
                                    
                                </tbody>
                            </table>
                        </div>
                        <script>
                        $('.get-input-focus').focus(function(){
                            $('.use_promo_code').removeAttr('disabled').removeClass('focus-button');
                            $('.tips-text,.clear-icon').show();
                            $('.tips-text').css({'color':'#999'})
                            $(this).css({'border':'1px solid #6064FF','color':'#6064FF'});
                            $('.error-text').hide();
                            $('.change-height').css({'height':'37px'})
                        })
                        $('.get-input-focus').blur(function(){
                            if($('.get-input-focus').val().trim() == '') {
                                $('.use_promo_code').addClass('focus-button').attr('disabled','disabled');
                                $('.tips-text,.clear-icon').hide();
                                $(this).css({'border':'1px solid #ced4da','color':'#6064FF'})
                            }
                        })
                        $(".modal-body").on('click','.tips-div font',function(){
                            $('.tips-div').hide()
                        })
                        $(".modal-body").on('click','.clear-icon',function(){
                            $('.get-input-focus').val('').focus();
                        })
                        </script>
                        <div class="yhm-flex">
                            <div style="width:60%">
                                <div class="d-flex mb-3 change-height" style="position:relative; margin-bottom: 0px !important">
                                <span class="tips-text">{$Lang.discount_code}</span>
                                <img class="clear-icon" src="/themes/clientarea/default/assets/images/clear-icon.png" />
                                <span class="error-text"></span>
                                    {if !$UpgradeConfig.promo_code}
                                    <input type="text" name="pormo_code" class="form-control get-input-focus" value="{$UpgradeConfig.promo_code}" placeholder="{$Lang.discount_code}" style="width:108px"/>
                                    <button class="btn btn-primary ml-2 use_promo_code focus-button" disabled
                                        type="button" style="width: auto; height:38px">{$Lang.application}</button>
                                    {else /}
                                        <span class="tips-text" style="display: block;">{$Lang.discount_code}</span>
                                    <span class="form-control" style="width:108px">{$UpgradeConfig.promo_code}</span>
                                    <button class="btn btn-primary ml-2 remove_promo_code" type="button" style="width: auto; height:38px" >{$Lang.remove}</button>
                                    {/if}
                                </div>
                                {if $UpgradeConfig.has_renew == true}
                                    <div class="tips-div"><img src="/themes/clientarea/default/assets/images/warning-icon.png">{$Lang.invoice_error}<font>x</font></div>
                                {/if}
                            </div>
                            <div style="width: 40%;">
                                <div class="text-right font-size-18" style="font-size: 12px !important; color:#999 !important; margin-bottom:10px !important">
                                    {$Lang.total}：<span class="text-primary" style="color:#6064FF !important;font-size:12px !important">{$UpgradeConfig.currency.prefix}<font style="font-weight: bold !important; font-size:18px !important">{$UpgradeConfig.total}</font>{$UpgradeConfig.currency.suffix}/{$UpgradeConfig.billingcycle_zh}</span>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="hid" style="display: none;" value="{$Think.get.id}">
                        {foreach $UpgradeConfig.configoptions as $key=>$item}
                        <input type="hidden" style="display: none;" name="configoption[{$key}]" value="{$item}">
                        {/foreach}
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary waves-effect waves-light submit">{$Lang.upgrade_next_step}</button>
                        <button type="button" class="btn btn-secondary waves-effect goback">{$Lang.return}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalUpgradeConfigStepSure" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered ">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title mt-0" id="myLargeModalLabel">确认</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p style="line-height: 100px;">您正在修改该产品的配置信息，请确认是否继续操作</p>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary waves-effect waves-light submit">确认</button>
                        <button type="button" class="btn btn-secondary waves-effect goback">{$Lang.return}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    function getUrlParam(name) {

    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象

    var r = window.location.search.substr(1).match(reg); //匹配目标参数

    if (r != null) return unescape(r[2]);

    return null; //{$Lang.return}参数值

}
      var product_type = '{$Detail.host_data.type}'
     var flag = true
       $('#modalUpgradeConfigStepTwo .submit').on('click', function(){
         if(flag){
                $('#modalUpgradeConfigStepTwo').modal('hide')
                            $('.modal-backdrop.fade.show').remove()
             $('#modalUpgradeConfigStepSure').modal("show");
         }
       })
       $('#modalUpgradeConfigStepSure .submit').on('click', function(){
         if(flag){
           flag = false
			$(this).prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>');
			let _this = $(this);
            let postRequest = function(){
                let url = "/upgrade/checkout_config_upgrade";
                $.ajax({
                    url: "/upgrade/checkout_config_upgrade",
                    data: $("#modalUpgradeConfigStepTwo form").serialize(),
                    type: "POST",
                    success: function(res){
                      // flag = true
                        if(res.status == 200){
                            window.location.href = "/viewbilling?id="+ res.data.invoiceid;
                        }else if(res.status == 1001){
                            toastr.success(res.msg)
                            window.location.reload()
                        }else{
                            toastr.error(res.msg)
                        }
             $('#modalUpgradeConfigStepSure').modal("hide");
                    },
                    error: function(){
                      //  flag = true
             $('#modalUpgradeConfigStepSure').modal("hide");
                    }
                })
            };
            if(product_type == 'cloud' || product_type == 'dcimcloud'){
                $('#modalUpgradeConfigStepTwo').modal('hide');
                $('.modal-backdrop.fade.show').remove()
                let content = "<div>"
                            + "<p>升降级需要服务器在关机状态下进行：</p>"
                            + "<p> 为了避免数据丢失，实例将关机中断您的业务，请仔细确认。 </p>"
                            + "<p> 强制关机可能会导致数据丢失或文件系统损坏，您也可以主动关机后再进行操作。</p>"
                            + "</div>";
                getModalConfirm(content, function(){
                    postRequest();
                });
            }else{
                postRequest();
            }
             }
        })
       

        $('#modalUpgradeConfigStepTwo .use_promo_code').on('click', function(){
            if(!$(this).data('submit')){
                $(this).data('submit', 1)
				/* $(this).prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>'); */
                let _this = $(this)
                $.ajax({
                    url: "/servicedetail?id={$Think.get.id}&action=upgrade_config_use_promo_code",
                    type: 'POST',
                    data: $('#modalUpgradeConfigStepTwo form').serialize(),
                    success: function(res){
                        if(res.indexOf('modalUpgradeConfigStepTwo') > -1){
                            $('#modalUpgradeConfigStepTwo').modal('hide');
                            $('.modal-backdrop.fade.show').remove()
                            $("#modalUpgradeConfigStepTwoDiv").html(res);
                            $('#modalUpgradeConfigStepTwo').modal("show");
                        }else if(res.indexOf('<script>') === 0){
                            $("#upgradeConfigDiv").append(res);
                        }
                        _this.removeData('submit')
						_this.html("{$Lang.application}");
                    },
                    error: function(){
                        _this.removeData('submit')
						_this.html("{$Lang.application}");
                    }
                })
                $.ajax({
                    url: "/upgrade/add_promo_code",
                    type: 'POST',
                    data: {
                        hid:getUrlParam('id'),
                        pormo_code: $('.get-input-focus').val(),
                        upgrade_type: 'configoptions'
                    },
                    success: function(res){
                        if(res.status != 200) {
                            $('.get-input-focus').css({'border':'1px solid #FF0000','color':'#999999'}).blur();
                            $('.use_promo_code').addClass('focus-button').attr('disabled','disabled');
                            $('.tips-text').css({'color':'#FF0000'})
                            $('.change-height').css({'height':'60px'})
                            $('.error-text').html(res.msg).show();
                        }
                    }
                })
            }
        })

        $('#modalUpgradeConfigStepTwo .remove_promo_code').on('click', function(){
            if(!$(this).data('submit')){
                $(this).data('submit', 1)
				$(this).prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>');
                let _this = $(this)
                $.ajax({
                    url: "/servicedetail?id={$Think.get.id}&action=upgrade_config_remove_promo_code",
                    type: 'POST',
                    data: $('#modalUpgradeConfigStepTwo form').serialize(),
                    success: function(res){
                        if(res.indexOf('modalUpgradeConfigStepTwo') > -1){
                            $('#modalUpgradeConfigStepTwo').modal('hide');
                            $('.modal-backdrop.fade.show').remove()
                            $("#modalUpgradeConfigStepTwoDiv").html(res);
                            $('#modalUpgradeConfigStepTwo').modal("show");
                        }else if(res.indexOf('<script>') === 0){
                            $("#upgradeConfigDiv").append(res);
                        }
                        _this.removeData('submit')
						_this.html("{$Lang.remove}");
                    },
                    error: function(){
                        _this.removeData('submit')
						_this.html("{$Lang.remove}");
                    }
                })
            }
        })

        $('#modalUpgradeConfigStepTwo .goback').on('click', function(){
            $('#modalUpgradeConfigStepTwo').modal('hide');
            $('.modal-backdrop.fade.show').remove()
            $('#modalUpgradeConfigStepTwoDiv').html('');

            $('#modalUpgradeConfigStepOne').modal('show');
        })

        $('#modalUpgradeConfigStepSure .goback').on('click', function(){
            $('#modalUpgradeConfigStepSure').modal('hide');
            $('.modal-backdrop.fade.show').remove()

            $('#modalUpgradeConfigStepTwo').modal('show');
        })
    </script>
    {/if}
{/if}
<style>
.focus-button:disabled{
    background: #DFDFDF;
    border: 0;
    width: 56px;
    color: #fff;
    cursor: no-drop;
}
.tips-text{
    position: absolute;
    font-size: 12px;
    transform: scale(0.5);
    top: -4px;
    left: 0px;
    color: #999999;
    display: none;
}
.clear-icon {
    position: absolute;
    width: 13px;
    height: 13px;
    left: 88px;
    top: 11px;
    cursor: pointer;
    display: none;
}
.error-text {
    position: absolute;
    bottom: 0px;
    font-size: 12px;
    color: #ff0000;
    display: none;
}
.tips-div{
    width: 70%;
    height: auto;
    background: #FDF6EC;
    border: 1px solid #FFD89F;
    opacity: 1;
    border-radius: 2px;
    color: #E6A23C;
    font-size: 12px;
    padding-left: 2px;
    position: relative;
    display: flex;
    align-items: center;
    padding: 6px 0px;
    margin-top: 10px;
}
.tips-div img {
    width: 13.5px;
    height: 13.5px;
    margin-left: 16px;
    margin-right: 5px;
}
.tips-div font {
    position: absolute;
    right: 13px;
    top: 4px;
    font-size: 12px;
    cursor: pointer;
}
.yhm-flex{
    display: flex;
    place-items: flex-end;
    padding-bottom: 10px;
}
/* 重写进度条 */
input[type='range'] {
    background: #F1F3F8;
    outline: none;
    -webkit-appearance: none; /*清除系统默认样式*/
    height: 4px; /*横条的高度*/
    border-radius: 3px;
    background: rgb(41, 72, 223) !important;
}
input[type="range"]::-webkit-slider-thumb {
     -webkit-appearance: none;
     width: 10px;
     height: 23px;
     background-color: #fff;
     /*box-shadow: 0 0 2px rgba(0, 0, 0, 0.3),
     0 3px 5px rgba(0, 0, 0, 0.2);*/
     cursor: pointer;
     border: 4px solid #2948DF;
     border-top-width: 5px;
     border-bottom-width: 5px;
     border-radius: 2px;
 }
 input[type="range"]::-moz-range-thumb {
      -webkit-appearance: none;
      width: 2px;
      height: 15px;
      background-color: #fff;
      /*box-shadow: 0 0 2px rgba(0, 0, 0, 0.3),
      0 3px 5px rgba(0, 0, 0, 0.2);*/
      cursor: pointer;
      border: 4px solid #2948DF;
      border-top-width: 5px;
      border-bottom-width: 5px;
      border-radius: 2px;
  }
.range_none{
    position: absolute;
    height: 3px;
    display: block;
    background: #DEDEDE;
    cursor: not-allowed
}
</style>
<!-- 滑块禁用区域 -->
<script>
	$('.configoption_range').each(function(){
		let sub = $(this).data('sub');
		let max = parseFloat($(this).attr('max'));
		let min = parseFloat($(this).attr('min'));
		let inputWidth = parseFloat($(this).width());
		let oneWidth = inputWidth / (max - min)
		let keyArr = [];
		sub.map(item => {
			let itemMin = parseFloat(item.qty_minimum)
			let itemMax = parseFloat(item.qty_maximum)
			keyArr.push(itemMin)
			for(var i = itemMin; i<itemMax; i++) {
				keyArr.push(i)
			}
			keyArr.push(itemMax)
		})
		keyArr = Array.from(new Set(keyArr));
		for(var t = min; t<max; t++) {
			if(keyArr.indexOf(t) == -1) {
				$(this).after('<span class="range_none" title="'+t+'" style="width: '+oneWidth+'px; left: '+oneWidth*(t-min)+'px "></span>')
			}
		}
	})					
</script>
