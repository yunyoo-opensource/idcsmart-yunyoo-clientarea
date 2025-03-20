{include file="includes/modal"}
<div class="withdraw" style="display: none;">
	<form>
		<input type="hidden" value="{$Token}" />
		<input type="hidden" name="type" value="1" />
		<div class="form-group row mb-4">
			<label class="col-sm-3 col-form-label text-right">{$Lang.withdrawal_amount}</label>
			<div class="col-sm-8">
				<input type="number" name="num" min="0" class="form-control" placeholder="{$Lang.please_withdrawal_amount}" required />
			</div>
		</div>
	</form>
</div>
<div class="row">
	<div class="col-sm-4">
		<div class="card bg-promote">
			<div class="card-body">
				<h4 class="fs-16 fw-400 text-white">{$Lang.can_ordering_time}</h4>
				<div class="row">
					<div class="col-12">
						<div class="aff-amo-num aff-amo-nums">
							{$Affiliates.data.balance}
							<small class="suffix">{$Affiliates.data.suffix}</small>
						</div>
					</div>
					<div class="col">
						<div class="aff-amo-num">
							{$Affiliates.data.withdraw_ing}
							<small class="suffix">{$Affiliates.data.suffix}</small>
						</div>
						<div class="aff-amo-title">
							{$Lang.amount_withdrawal}
						</div>
					</div>
					<div class="col">
						<div class="aff-amo-num">
							{$Affiliates.data.audited_balance}
							<small class="suffix">{$Affiliates.data.suffix}</small>
						</div>
						<div class="aff-amo-title">
							{$Lang.frozen_amount}
						</div>
					</div>
					<div class="col d-flex align-items-center justify-content-center"
          data-toggle="popover" data-trigger="hover" data-html="true" data-content="{$Lang.minimum_withdrawal_amount}:{$Affiliates.affiliate_withdraw}{$Affiliates.data.suffix}"
          >
						<button onClick="getModal('withdraw', '{$Lang.immediate_withdrawal}',undefined,undefined,
                refresh)" class="btn bg-white px-3" id="withdrawNow"
                
                 {if $Affiliates.affiliate_withdraw>$Affiliates.data.balance}disabled{/if} style="color: #b074d1;">{$Lang.immediate_withdrawal}</button>

            
					</div> 
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-body p-0">
				<div class="aff-items">
					<div class="aff-item border-bottom">
						<div class="aff-item-title">
							<i class="bx bx-shopping-bag mr-2"></i>
							{$Lang.purchase_order_quantity}
						</div>
						<div class="aff-item-num">{$Affiliates.data.payamount}</div>
					</div>
					<div class="aff-item border-bottom">
						<div class="aff-item-title">
							<i class="bx bx-calendar mr-2"></i>
							{$Lang.promotion_link_visits}
						</div>
						<div class="aff-item-num">{$Affiliates.data.visitors}</div>
					</div>
					<div class="aff-item">
						<div class="aff-item-title">
							<i class="bx bx-user mr-2"></i>
							{$Lang.registered_users}
						</div>
						<div class="aff-item-num">{$Affiliates.data.registcount}</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				{foreach $Affiliates.datarr as $data}
				<div class="security-item">
					<div class="security-item-info">
						<div class="security-item-text">
							<h4 class="security-item-title">
								{$data.affiliate_name}
							</h4>
							<div class="security-item-desc">
								{$data.affiliate_des}
							</div>
						</div>
						<span class="badge badge-pill badge-soft-success">
							{$data.affiliate_type}
							{$data.affiliate_bates}
						</span>
					</div>
				</div>
				<!-- Security-item END -->
				{/foreach}
			</div>
		</div>
	</div>
	<div class="col-sm-8">
<script>
document.addEventListener("DOMContentLoaded", function() {
    var elements = document.querySelectorAll("#url_identy");
    
    elements.forEach(function(element) {
        element.innerHTML = '{$Affiliates.data.url_identy}';
    });
});
</script>
		<div class="card">
			<div class="card-body">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text bg-white fw-500">{$Lang.recommended_links}</span>
					</div>

					<input class="form-control col-sm-7" id="referralLink" type="text" value="{$Affiliates.data.url}" readonly />

					<div class="input-group-append">
						<button class="btn-copy btn btn-default" id="copyBtn">
							<i class="fas fa-copy"></i>
						</button>
					</div>


				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-body p-0">
				<ul class="affs-nav nav nav-tabs nav-tabs-custom nav-justified" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#affbuyrecord" role="tab" aria-selected="true">
							{$Lang.promotion_record}
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#withdrawrecord" role="tab" aria-selected="false">
							{$Lang.withdrawal_record}
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#useraffilist" role="tab" aria-selected="false">
							{$Lang.registered_users}
						</a>
					</li>
				</ul>
				<div class="tab-content p-3 text-muted">
					<div id="affbuyrecord" class="tab-pane active" role="tabpanel">

					</div>
					<div id="withdrawrecord" class="tab-pane" role="tabpanel">

					</div>
					<div id="useraffilist" class="tab-pane" role="tabpanel">

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function refresh() { 
		location.reload();
	}
	$(document).ready(function () {
		$('#copyBtn').on('click', function () {
			$('#referralLink').select()
			document.execCommand("Copy")
			toastr.success('{$Lang.copy_succeeded}')
		});
	});
</script>

<script>
	$(document).ready(function () {
		$.ajax({
			type: "get",
			url: '' + '/affiliates',
			data: {
				action: 'affbuyrecord'
			},
			success: function (data) {
				$(data).appendTo('#affbuyrecord');
			}
		});
		$.ajax({
			type: "get",
			url: '' + '/affiliates',
			data: {
				action: 'withdrawrecord'
			},
			success: function (data) {
				$(data).appendTo('#withdrawrecord');
			}
		});
		$.ajax({
			type: "get",
			url: '' + '/affiliates',
			data: {
				action: 'useraffilist'
			},
			success: function (data) {
				$(data).appendTo('#useraffilist');
			}
		});
	});
</script>
