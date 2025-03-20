{if $Detail.dcimcloud && ($Detail.dcimcloud.nat_acl || $Detail.dcimcloud.nat_web)}
<div class="bg-primary rounded-sm d-flex flex-column justify-content-center text-white py-2 px-1 mb-2">
  {if $Detail.dcimcloud.nat_acl}
  <div class="d-flex justify-content-between align-items-center">
    <span>
      <label>{$Lang.remote_address}：</label>
      <span id="nat_aclBox">{$Detail.dcimcloud.nat_acl}</span>
    </span>
    <span>
      <i class="bx bx-copy pointer text-white btn-copy" id="btnCopyaclBox" data-clipboard-action="copy"
        data-clipboard-target="#nat_aclBox"></i>
    </span>
  </div>
  {/if}
  {if $Detail.dcimcloud.nat_web}
  <div class="d-flex justify-content-between align-items-center">
    <span>
      <label>{$Lang.ip_address}建站解析：</label>
      <span id="nat_webBox">{$Detail.dcimcloud.nat_web}</span>
    </span>
    <span>
      <i class="bx bx-copy pointer text-white btn-copy" id="btnCopywebBox" data-clipboard-action="copy"
        data-clipboard-target="#nat_webBox"></i>
    </span>
  </div>
  {/if}
</div>
{/if}