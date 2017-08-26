![CoolSlidingMenu](http://upload-images.jianshu.io/upload_images/2484280-ae9929e9a3bdf56d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#CoolSlidingMenu

## 开发环境

 Mac OS 10.12+ / Xcode 8+ / Swift 3+
## 支持环境
iOS 8+, iPhone & iPad
## 项目获取
此处代码由Swift3.1展示，推荐使用Swift项目已经上传至github中[CoolSlidingMenu](https://github.com/cba023/CoolSlidingMenu)(https://github.com/cba023/CoolSlidingMenu)，若要使用，请导入文件到您的项目。
简书地址：http://www.jianshu.com/p/375fe7984571

## 功能展示
![User guide](http://upload-images.jianshu.io/upload_images/2484280-480a97d166e5e734.gif?imageMogr2/auto-orient/strip)

## 使用说明
### 导入项目
#### 1. 手动导入
![手动导入项目需要将该文件夹的所有内容引入项目中](http://upload-images.jianshu.io/upload_images/2484280-69a18c4e2d12e6ae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

如图所示，将“CoolSlingMenu”文件夹拖入要用到该框架的工程中，在Swift项目中，可直接对其进行使用，ObjC项目中需要用到桥接。

### 对项目菜单进行定制

#### 创建滚动菜单视图
```
var slidingMenuView = CoolSlidingMenuView()
```
#### 定制我们要使用的CoolSlidingMenu

```
// 显示滑动菜单pageControl
slidingMenuView.pgCtrl.isHidden = false  
// 未选中页pageControl颜色
slidingMenuView.pgCtrlNormalColor = .lightGray
// 选中页pageControl颜色
slidingMenuView.pgCtrlSelectedColor = .red
// 设置滑动菜单的行数
slidingMenuView.countRow = 2
// 设置滑动菜单的列数
slidingMenuView.countCol = 5
```
#### CoolSlidingMenu数据源
数组格式如下所示：
![屏幕快照 2017-08-20 16.14.21.png](http://upload-images.jianshu.io/upload_images/2484280-e3fea1a11597cec1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

滑动菜单数据源是带title 和image 两个key的字典型数组:
```
let arrMenu = [
  ["title":"0美食","image":"img1.png"],
  ["title":"2电影","image":"img2.png"],
  ["title":"3健身","image":"img3.png"]
]
slidingMenuView.arrMenu = arrMenu
```
添加CoolSlidingMenu到视图中

```
let width = UIScreen.main.bounds.size.width
slidingMenuView.contentMode = .scaleAspectFit
// 行数2， 列数5，pageControl预留高度8
slidingMenuView.frame = CGRect(x: 0, y: 0, width: width, height: width / 5.0 * 2.0 + 8.0)
self.view.addSubview(slidingMenuView)
```

## 实现原理

CoolSlidingMenu主要通过UICollectionView实现，在滑动菜单中，是从左至右排列的，所以我们想要的布局如下：
![1.我们想要的效果](http://upload-images.jianshu.io/upload_images/2484280-aa5761c29f84f722.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
然而，UICollectionView的实际排列确实纵向排列。如下图：
![2.UICollectionView默认的排列方式](http://upload-images.jianshu.io/upload_images/2484280-203bf075a12d916a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

所以我们要将纵向排列转换成横向排列，CoolSlidingMenu中用到转换函数如下：
```
/// Converting the ordering of Numbers Author: ChenBo
    ///
    /// - Parameters:
    ///   - number: input number  输入的数字
    ///   - rowCount: rows count   行数
    ///   - colCount: cols count   列数
    /// - Returns: output number  输出的数字
func convertDirectionCount(Number number:Int, RowCount rowCount: Int, ColCount colCount: Int) -> Int {
        // 十位
        let tempH = number / (colCount * rowCount)
        // 个位
        let tempL = number % (colCount * rowCount)
        let result:Int = tempL - (tempL / rowCount) * (rowCount - 1) + tempL % rowCount * (colCount - 1) + tempH * (colCount * rowCount)
//        print("排序前:",number,"行数：",rowCount, "列数：" ,"tempH:",tempH,"tempL:",tempL, colCount,"----->",result)
        return result
    }
```

经过转换，滑动菜单就从纵向排列转化为横向排列了。 亲，懂了吗？赶快去嗨皮吧！
##  致读者

该项目已经上传至github中[CoolSlidingMenu](https://github.com/cba023/CoolSlidingMenu)(https://github.com/cba023/CoolSlidingMenu)
可以在那里直接star 或者fork 该项目，它可能会长期的帮助您高效地进行程序开发，当然也欢迎留言，有不足或者错误的地方可以随时指正，您的指导和建议是我前行路上新的动力！
