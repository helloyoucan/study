<script>
  let name = "world";
  let a = 1;
  let b = 2;
  let yes = false;

  let scoops = 1;
  let flavours = ["Mint choc chip"];
  function join(flavours) {
    if (flavours.length === 1) return flavours[0];
    return `${flavours.slice(0, -1).join(", ")} and ${
      flavours[flavours.length - 1]
    }`;
  }
  let menu = ["Cookies and cream", "Mint choc chip", "Raspberry ripple"];
  let value = ''
  let html = '<p>Write some text!</p>';
</script>

<p>表单</p>
<input bind:value={name} />

<h1>Hello {name}</h1>
<p>
  svelte
  中的bind:value可以返回number类型的数据（默认input返回的e.target.value是String）
</p>
<label>
  <input type="number" bind:value={a} min="0" max="10" />
  <input type="range" bind:value={a} min="0" max="10" />
</label>

<label>
  <input type="number" bind:value={b} min="0" max="10" />
  <input type="range" bind:value={b} min="0" max="10" />
</label>

<p>{a} + {b} = {a + b}</p>

<p>复选框的使用（bind:checked）</p>
<label>
  <input type="checkbox" bind:checked={yes} />
  Yes! Send me regular email spam
</label>

{#if yes}
  <p>Thank you. We will bombard your inbox and sell your personal details.</p>
{:else}
  <p>You must opt in to continue. If you're not paying, you're the product.</p>
{/if}

<button disabled={!yes}>Subscribe</button>

<p>单选框和复选框组的使用(scoops)</p>

<h2>Size</h2>
<input type="radio" bind:group={scoops} value={1} />
one
<input type="radio" bind:group={scoops} value={2} />
two
<input type="radio" bind:group={scoops} value={3} />
three
<p>{scoops}</p>
<h2>Flavours</h2>

{#each menu as flavour}
  <label>
    <input type="checkbox" bind:group={flavours} value={flavour} />
    {flavour}
  </label>
{/each}
{#if flavours.length === 0}
  <p>Please select at least one flavour</p>
{:else if flavours.length > scoops}
  <p>Can't order more flavours than scoops!</p>
{:else}
  <p>
    You ordered {scoops} {scoops === 1 ? 'scoop' : 'scoops'} of {join(flavours)}
  </p>
{/if}
<p>文本输入</p>
<textarea bind:value={value}/>
<p>指令和绑定的属性名一样，则可以省略</p>
<textarea bind:value/>
{@html value}

<p>bind:innerHTML支持元素的编辑模式contenteditable</p>
<div bind:innerHTML={html} contenteditable="true" style="border:1px solid #000;height:200px;"></div>

<pre>{html}</pre>