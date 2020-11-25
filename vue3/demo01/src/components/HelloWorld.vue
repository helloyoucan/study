<template>
  <p>counter:{{ counter }}</p>
</template>

<script>
import { ref, onMounted, watch,computed  } from 'vue';
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  setup(props) {
    console.log('props:', props);
    const counter = ref(0);
    console.log('counter:', counter);
    console.log('counter.value:', counter.value);
    const countFn = () => {
      // setInterval(() => {
        counter.value++;
      // }, 1000)
    }
    onMounted(() => {
      console.log('setup onMounted')
    });
    const twiceTheCounter = computed(() => counter.value * 2)

    watch(counter, (newValue, oldValue) => {
      console.log('The new counter value is: ' + counter.value)
      console.log('twiceTheCounter:',twiceTheCounter);
    });
    return {
      sayHello: () => console.log('hello vue3'),
      countFn,
      counter
    }
  },
  created() {
    this.sayHello();
    this.countFn();
    // setInterval(() => {
      console.log('this.counter:', this.counter)
    // }, 1000)
  }
}
</script>
