import Phaser from "phaser";
var config = {
  type: Phaser.AUTO,
  width: 800,
  height: 600,
  physics: {
    default: 'arcade',
    arcade: {
      gravity: { y: 300 },
      debug: false
    }
  },
  scene: {
    preload: preload,
    create: create,
    update: update
  }

}
var game = new Phaser.Game(config);

function preload() {
  this.load.image('sky', require('./assets/sky.png'));
  this.load.image('ground', require('./assets/platform.png'));
  this.load.image('star', require('./assets/star.png'));
  this.load.image('bomb', require('./assets/bomb.png'));
  this.load.spritesheet('dude', require('./assets/dude.png'), { frameWidth: 32, frameHeight: 48 });
}
var platforms;
var player;
var cursors;
var satr;
function create() {
  this.add.image(400, 300, 'sky');
  platforms = this.physics.add.staticGroup(); // 生成静态物理组
  platforms.create(400, 568, 'ground').setScale(2).refreshBody();//缩放的是静态物体，所以需要调用refreshBody，通知物理世界
  platforms.create(600, 400, 'ground');
  platforms.create(50, 250, 'ground');
  platforms.create(750, 220, 'ground');
  // this.add.image(400,300,'star');

  // 生成精灵
  player = this.physics.add.sprite(100, 450, 'dude'); // 可以动的物体
  player.setBounce(0.2);//起跳跌落后会反弹0.2
  player.setCollideWorldBounds(true);// 不能走出边界
  // 向左走的动画帧
  this.anims.create({
    key: 'left',
    frames: this.anims.generateFrameNumbers('dude', { start: 0, end: 3 }),
    frameRate: 10,//每秒10帧
    repeat: -1
  })
  // 面向的动画帧
  this.anims.create({
    key: 'turn',
    frames: [{ key: 'dude', frame: 4 }]
  })
  // 向右走的动画帧
  this.anims.create({
    key: 'right',
    frames: this.anims.generateFrameNumbers('dude', { start: 5, end: 8 }),
    frameRate: 10,
    repeat: -1
  })
  // player.body.setGravityY(300); //重力
  this.physics.add.collider(player, platforms);//碰撞检测
  // 事件监听
  cursors = this.input.keyboard.createCursorKeys();

  // 动态物理的星星

}

function update() {
  if (cursors.left.isDown) {
    player.setVelocityX(-160);//水平速度
    player.anims.play('left', true);
  }
   else if (cursors.right.isDown) {
    player.setVelocityX(160);
    player.anims.play('right', true);
  }
   else {
    player.setVelocityX(0);
    player.anims.play('turn');
  }
  if (cursors.up.isDown && player.body.touching.down) {//是否按下up键&&是否与地面接触
    player.setVelocityY(-330);//垂直速度
  }
}