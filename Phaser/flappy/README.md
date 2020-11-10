# 实现游戏的关键代码

### 源码地址：[https://github.com/helloyoucan/study/tree/master/Phaser/flappy](https://github.com/helloyoucan/study/tree/master/Phaser/flappy)
### 第一步：前期准备（准备资源、devServer、创建游戏、准备一些常量：小鸟速度和Y方向的重力、管道参数等） 
##### 打开/src/index.js文件，添加以上相关内容。
### 第二步：加载资源 
两个图片资源：
1*1像素的小鸟：![bird.png](https://cdn.nlark.com/yuque/0/2020/png/1210067/1604998135629-b3e8c974-59e0-4014-99e2-9af1f2e7b34f.png#align=left&display=inline&height=30&margin=%5Bobject%20Object%5D&name=bird.png&originHeight=30&originWidth=30&size=138&status=done&style=none&width=30)
管道：
![pipe.png](https://cdn.nlark.com/yuque/0/2020/png/1210067/1604998151768-6fed7e92-096a-4171-a0f2-7b6fd6496267.png#align=left&display=inline&height=480&margin=%5Bobject%20Object%5D&name=pipe.png&originHeight=480&originWidth=60&size=464&status=done&style=none&width=60)
##### 在场景的preload方法里加载资源：
```javascript
this.load.image('bird', './image/bird.png');
this.load.image('pipe', './image/pipe.png');
```


### 第三步：把小鸟放到场景里面，并让小鸟动起来 
![image.png](https://cdn.nlark.com/yuque/0/2020/png/1210067/1604998595310-cd8fe991-8a83-41ac-9144-0c4f0b6c8982.png#align=left&display=inline&height=601&margin=%5Bobject%20Object%5D&name=image.png&originHeight=601&originWidth=802&size=22407&status=done&style=none&width=802)
##### 在场景的create方法里，新增代码：
```javascript
  // 创建小鸟
  bird = this.physics.add.sprite(
    80,
    +this.game.config.height / 2,
    "bird"
  );
   //给小鸟一个向下的重力
  bird.body.gravity.y = gameOptions.birdGravity;
   //监听场景点击,让小鸟飞起来
  this.input.on("pointerdown", flap, this);
```
##### 新增让小鸟飞一下的方法：
```javascript
/**
* 飞一下，然后又因为重力掉下来
*/
function flap() {
  bird.body.velocity.y = -gameOptions.birdFlapPower;
}
```
### 第四步：把管道放到场景里面，并将所有管道匀速往左边移动
### ![image.png](https://cdn.nlark.com/yuque/0/2020/png/1210067/1604998720906-bc707184-fb8b-4ede-8775-98c6df9421f1.png#align=left&display=inline&height=602&margin=%5Bobject%20Object%5D&name=image.png&originHeight=602&originWidth=800&size=19000&status=done&style=none&width=800)
##### 在场景的create方法里，新增代码：
```javascript
  //创建管道组
  pipeGroup = this.physics.add.group();
  pipePool = [];
  for (let i = 0; i < 4; i++) {
    // 创建上下对应的一组柱子
    pipePool.push(pipeGroup.create(0, 0, "pipe"));
    pipePool.push(pipeGroup.create(0, 0, "pipe"));
    placePipes(false); //设置刚刚生成的两个上下对应的管道
  }
  pipeGroup.setVelocityX(-gameOptions.birdSpeed); //给这个组一个向左的速度
```
##### ![image.png](https://cdn.nlark.com/yuque/0/2020/png/1210067/1604999116397-5f1839d1-b977-4bfe-a9cd-7f3899134e24.png#align=left&display=inline&height=602&margin=%5Bobject%20Object%5D&name=image.png&originHeight=602&originWidth=802&size=25446&status=done&style=none&width=802)新增设置上下两个管道的坐标方法代码：
```javascript
/**
 * 设置上下两个管道的x坐标
 * @param addScore 是否增加分数
 */
function placePipes(addScore) {
  let rightmost = getRightmostPipe();
  //随机获取上下两个管道的距离
  let pipeHoleHeight = Phaser.Math.Between(
    gameOptions.pipeHole[0],
    gameOptions.pipeHole[1]
  );
  // 随机获取上下管道的之间的中点的y坐标
  let pipeHolePosition = Phaser.Math.Between(
    gameOptions.minPipeHeight + pipeHoleHeight / 2,
    + game.config.height - gameOptions.minPipeHeight - pipeHoleHeight / 2
  );
  //设置上下两个柱子的位置及高度
  pipePool[0].x = rightmost + pipePool[0].getBounds().width + Phaser.Math.Between(gameOptions.pipeDistance[0], gameOptions.pipeDistance[1]);
  pipePool[0].y = pipeHolePosition - pipeHoleHeight / 2;
  pipePool[0].setOrigin(0, 1);
  // this.pipePool[0].setImmovable(false);
  //下面的管道
  pipePool[1].x = pipePool[0].x;
  pipePool[1].y = pipeHolePosition + pipeHoleHeight / 2;
  pipePool[1].setOrigin(0, 0);
  // this.pipePool[1].setImmovable(false);

  pipePool = []; //清空上下两个管道
  if (addScore) { // 是否获得分数
    updateScore(1);
  }
}
```
##### 新增获取最右边柱子的x坐标，用于设置新增柱子的位置：
```javascript
/**
 * 获取最右边的柱子的x坐标
 */
function getRightmostPipe() {
  let rightmostPipe = 0;
  pipeGroup.getChildren().forEach(function (pipe) {
    rightmostPipe = Math.max(rightmostPipe, pipe.x);
  });
  return rightmostPipe;
}
```


##### 新增更新分数的方法：
```javascript

/**
  *  更新分数
  * @param inc 增加的分数
  */
 function updateScore(inc) {
  score += inc;
  scoreText.text = "Score: " + score + "\nBest: " + topScore;
}
```


### 第五步：游戏结束条件、新增管道 、分数获得条件
##### ![image.png](https://cdn.nlark.com/yuque/0/2020/png/1210067/1604999443813-9667a48d-5aff-4a89-8f28-1fb5a4ed54a2.png#align=left&display=inline&height=601&margin=%5Bobject%20Object%5D&name=image.png&originHeight=601&originWidth=801&size=26942&status=done&style=none&width=801)
##### 在场景的update方法里新增代码：
```javascript
// 碰撞监测
  this.physics.world.collide(
    bird,
    pipeGroup,
    function () {
      die.apply(this);
    },
    null,
    this
  );
  if (bird.y > this.game.config.height || bird.y < 0) {
    //小鸟飞出场景的上下边界
    die.apply(this);
  }
  // 增加柱子
  pipeGroup.getChildren().forEach(function (pipe) {
    if (pipe.getBounds().right < 0) {
      //x+width=right
      // 这个柱子已经超全部出场景的左边界（看不到了）
      pipePool.push(pipe);
      if (pipePool.length == 2) {
        //上下两个管，所以长度为2
        //新增一组管道，并新增一点分数
        placePipes(true);
      }
    }
  }, this);
```


### 第六步：玩起来！
##### 点击游戏场景即可玩游戏。
