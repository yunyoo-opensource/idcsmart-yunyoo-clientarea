<style>
	@media (min-width: 560px) and (max-width: 930px) {
		.addfunds-payment img {
			height: 16px !important;
			width: auto !important;
		}
	}

	@media (min-width: 576px) {
		.addfunds {
			max-width: 200px;
		}

		input#addfundsInp {
			width: 6rem !important;
		}
	}

	.addfunds-payment img {
		width: 100%;
		max-width: 100px;
		height: auto;
	}

	input#addfundsInp {
		border-top: none;
		border-right: none;
		border-left: none;
		border-radius: 0;
		height: 1.25em;
	}

	input#addfundsInp {
		width: 100%;
	}
</style>
<div class="card">
	<div class="card-body p-5">
		<div class="beforecheck-box">
			<div class="alert alert-danger alert-dismissible fade hidden beforecheck" role="alert">
				<i class="mdi mdi-block-helper mr-2"></i>
				<span
					class="msg-box">{$Lang.the_maximum_allowed_balance_exceeded}:{$Addfunds.addfunds.addfunds_maximum_balance}</span>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
		</div>
		<div method="post">
			<div class="form-group row mb-4 align-items-center flex-nowrap">
				<label for="horizontal-firstname-input"
					class="col-3 col-sm-auto col-form-label">{$Lang.current_balance}</label>
				<div class="col-sm-9">
					<span
						class="fs-30 text-primary yunyoo-num mr-1">{$Addfunds.addfunds.credit}</span>{$Addfunds.addfunds.currency.suffix}
				</div>
			</div>
			<div class="form-group row mb-3 align-items-center">
				<label for="addfundsInp" class="col-3 col-sm-auto col-form-label">充值金额</label>
				<div class="col-sm-auto col-6">
					<input type="text" name="amount" class="form-control fs-30 p-0 yunyoo-num" id="addfundsInp"
						value="1.00" onblur="if (!window.__cfRLUnblockHandlers) return false; addfundsMaxMin()"
						spellcheck="false" data-ms-editor="true">
				</div>
				<div class="col-sm-1 col-2">元</div>

			</div>
			<div class="form-group row mb-4">
				<div class="col-sm ml-sm-5 pl-sm-5">
					<div class="row">
						<div class="col-3 col-sm-auto p-1"><button type="button"
								class="btn btn-outline-primary quick-amount w-100" data-amount="10.00">10元</button>
						</div>
						<div class="col-3 col-sm-auto p-1"><button type="button"
								class="btn btn-outline-primary quick-amount w-100" data-amount="20.00">20元</button>
						</div>
						<div class="col-3 col-sm-auto p-1"><button type="button"
								class="btn btn-outline-primary quick-amount w-100" data-amount="50.00">50元</button>
						</div>
						<div class="col-3 col-sm-auto p-1"><button type="button"
								class="btn btn-outline-primary quick-amount w-100" data-amount="100.00">100元</button>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row mb-5">
				<label for="horizontal-password-input" class="col-sm-auto col-form-label">{$Lang.payment_method}</label>
				<div class="col-sm">
					<div class="row">
						{foreach $Addfunds.addfunds.gateways as $index=>$gateways}
						<div class="col-sm-3 addfunds p-1" onclick="addfundsBtn(this)">
							<div class="rounded addfunds-payment {if $index==0}active{/if}"
								data-payment="{$gateways.name}" title="{$gateways.title}" data-toggle="tooltip"
								data-placement="bottom">
								<input type="radio" name="payment" class="hidden" value="{$gateways.name}" {if
									$index==0}checked{/if} />
								{if $gateways.author_url}
								<img src="{$gateways.author_url}" />
								{else}
								{$gateways.title}
								{/if}
							</div>
						</div>
						{/foreach}
					</div>
				</div>
			</div>
			<div class="form-group row">

				<div class="col-sm">
					<button type="button" class="btn btn-primary btn-block pay-now-btn" style="width: auto;"
						onclick="formSubmitBtn();return false;">{$Lang.confirm_recharge}</button>
				</div>
			</div>
		</div>
	</div>
</div>

{include file="includes/paymodal"}

<script type="text/javascript"
	src="/themes/clientarea/yunyoo/assets/libs/qrcode/jquery.qrcode.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/yunyoo/assets/libs/dropzone/min/dropzone.min.js?v={$Ver}"></script>
<script type="text/javascript">

	var intervalBox;
	var max = '{$Addfunds.addfunds.addfunds_maximum}',
		min = '{$Addfunds.addfunds.addfunds_minimum}'
		, _url = '';
</script>
<script>
	$(document).ready(function () {
		$('.quick-amount').on('click', function () {
			var amount = $(this).data('amount');
			$('#addfundsInp').val(amount).trigger('input');
		});
	});
</script>
<script src="/themes/clientarea/yunyoo/assets/js/addfunds.js?v={$Ver}"></script>