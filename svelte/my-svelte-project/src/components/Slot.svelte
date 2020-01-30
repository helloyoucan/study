<script>
  let slotValue = "插槽传值";
</script>

<h2>slot</h2>
<div>
  <slot>iam slot defalut content</slot>
</div>

<p>
  <slot name="slotName" />
</p>

<p>插槽传值</p>
<p>
  <slot name="slotValue" aa={slotValue} />
</p>
