import { writable, readable, derived } from 'svelte/store'
export const count = writable(55);
export const time = readable(new Date(), function start(set) {
    const interval = setInterval(() => {
        set(new Date());
    }, 1000);

    return function stop() {
        clearInterval(interval);
    };
});
// 类似vuex的getter
export const seconds = derived(
    time,
    ($time, set) => {
        return $time.getSeconds()
    }
);

// 其它用法
const summed = derived([count, time], ([$a, $b]) => $a + $b);
const delayed = derived([count, time], ([$a, $b], set) => {
    setTimeout(() => set($a + $b), 1000);
});

function createCount2() {
    const { subscribe, set, update } = writable(0);
    return {
        subscribe,
        // 扩展方法（类似vuex的action？）
        add() {
            update(n => n + 1)
        },
        minus: () => {
            update(n => n - 1)
        },
        reset: () => {
            set(0)
        }
    }
}
// 扩展的用法
export const count2 = createCount2();