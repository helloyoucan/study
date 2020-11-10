import Phaser from "phaser";
const config = {
  width: 800,
  height: 600,
  // zoom: 0.6,
  type: Phaser.AUTO,
  parent: "game",
  input: {
    keyboard: true
  },
  physics: {
    default: "arcade",
    arcade: {
      gravity: { y: 0 },
      debug: false
    }
  },
  backgroundColor: "#000000",
  render: { pixelArt: false, antialias: true },
  scene: {
    preload: preload,
    create: create,
    update: update
  }
}
const game = new Phaser.Game(config);


var gameOptions = {
  birdGravity: 800, //小鸟收到的重力

  birdSpeed: 125, //小鸟水平的速度

  birdFlapPower: 300, //点击屏幕后小鸟向上飞的速度

  minPipeHeight: 50, //管道的最小高度

  pipeDistance: [220, 280], //管道之间的距离，随机使用

  pipeHole: [100, 130], //上下两个管道的距离，随机使用

  localStorageName: "bestFlappyScore", //存储在本地的历史最高分数的key
};


var pipeGroup,
  pipePool = [], //存放管子
  bird,
  score = 0,
  topScore,
  scoreText;
function preload() {
  this.load.image('bird', './image/bird.png');
  this.load.image('pipe', './image/pipe.png');
}
function create() {
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
  pipeGroup = this.physics.add.group();
  pipePool = [];
  for (let i = 0; i < 4; i++) {
    // 创建上下对应的一组柱子
    pipePool.push(pipeGroup.create(0, 0, "pipe"));
    pipePool.push(pipeGroup.create(0, 0, "pipe"));
    placePipes(false); //设置刚刚生成的两个上下对应的管道
  }
  pipeGroup.setVelocityX(-gameOptions.birdSpeed); //给这个组一个向左的速度



  // 显示分数
  topScore = +(localStorage.getItem(gameOptions.localStorageName) || "0")
  scoreText = this.add.text(10, 10, "");
  updateScore(score);
}
function update() {
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
}




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
  if (addScore) {
    updateScore(1);
  }
}
/**
* 飞一下，然后又因为重力掉下来
*/
function flap() {
  bird.body.velocity.y = -gameOptions.birdFlapPower;
}
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
/**
 * 小鸟碰到物体，停止游戏
 */
function die() {
  localStorage.setItem(
    gameOptions.localStorageName,
    Math.max(score, topScore).toString()
  );
  pipeGroup.setVelocityX(0);
  // 3秒后游戏重开
  this.add.tween({
    targets: { time: 1 },
    time: 0,
    duration: 3000,
    onComplete: () => {
      this.scene.start();
    },
  });
}

/**
  *  更新分数
  * @param inc
  */
 function updateScore(inc) {
  score += inc;
  scoreText.text = "Score: " + score + "\nBest: " + topScore;
}