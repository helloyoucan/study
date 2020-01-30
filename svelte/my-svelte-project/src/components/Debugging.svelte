<script>
	let user = {
		firstname: 'Ada',
		lastname: 'Lovelace'
	};
</script>
<h2>Dubugging</h2>
<input bind:value={user.firstname}>
<input bind:value={user.lastname}>

{(console.log(user), '')}
<!-- {@debug user} -->
<h1>Hello {user.firstname}!</h1>