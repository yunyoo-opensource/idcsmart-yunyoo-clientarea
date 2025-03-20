{if $ErrorMsg}
	{include file="error/alert" value="$ErrorMsg"}
{/if}

{if $SuccessMsg}
	{include file="error/notifications" value="$SuccessMsg" url="supporttickets"}
{/if}

{if $SubmitTicket.department}
	{if $Think.get.step != '2'}
		{include file="supporttickets/supporttickets-one"}
	{else}
		{include file="supporttickets/supporttickets-two"}
	{/if}
{else}
	{include file="supporttickets/supporttickets-two"}
{/if}