<script>
  let user = { loggedIn: false };
  function togged() {
    user.loggedIn = !user.loggedIn;
  }
  let x = 7;
  let cats = [
    { id: "J---aiyznGQ", name: "Keyboard Cat" },
    { id: "z_AbfPXTKms", name: "Maru" },
    { id: "OUtn3pvWmpg", name: "Henri The Existential Cat" }
  ];
  let things = [
    { id: 1, color: "#0d0887" },
    { id: 2, color: "#6a00a8" },
    { id: 3, color: "#b12a90" },
    { id: 4, color: "#e16462" },
    { id: 5, color: "#fca636" }
  ];

  function handleClick() {
    things = things.slice(1);
  }
</script>

{#if user.loggedIn}
  <button on:click={togged}>log out</button>
{/if}
{#if !user.loggedIn}
  <button on:click={togged}>log in</button>
{/if}
{#if user.loggedIn}
  <button on:click={togged}>log out</button>
{:else}
  <button on:click={togged}>log in</button>
{/if}

{#if x > 10}
  <p>x >10</p>
{:else if x > 5}
  <p>x >5</p>
{:else}
  <p>x</p>
{/if}
简单使用
<ul>
  {#each cats as cat}
    <li>{cat.name}</li>
  {/each}
</ul>
索引
<ul>
  {#each cats as cat, i}
    <li>{i + 1}:{cat.name}</li>
  {/each}
</ul>
解构
<ul>
  {#each cats as { name, id }, i}
    <li>{i + 1}:{name},{id}</li>
  {/each}
</ul>
唯一标识（vue中的key）
<button on:click={handleClick}>del</button>
<ul>
  {#each things as { color, id }, i}
    <li current={color} style={'background:'+color}>{i + 1}:{color},{id}</li>
  {/each}
</ul>
