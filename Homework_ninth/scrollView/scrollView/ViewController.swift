//
//  ViewController.swift
//  scrollView
//
//  Created by student on 2018/11/13.
//  Copyright © 2018年 Young. All rights reserved.
//

import UIKit
//UIScrollViewDelegate协议声明的方法允许采用该协议的委托响应来自UIScrollView类的消息，从而响应滚动、缩放、滚动内容减速和滚动动画等操作，并在一定程度上影响这些操作。
class ViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var scrollView1: UIScrollView!
    //PageController要在ScrollView1的之外，即不是其子类，否则在scrollView翻页的同时一起翻动
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrollView2: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //轮播
        scrollView1.delegate = self
        
        for i in 1...5 {
            let imageView = UIImageView(image:UIImage(named:"\(i)"))
            //图片的横坐标要随滚动变化而变化，第一张（0，0）/第二章（scrollView1.bounds.width，0）/第三张（scrollView1.bounds.width*2，0） 按此规律
            imageView.frame = CGRect(x: CGFloat(i-1)*scrollView1.bounds.width, y: 0, width: scrollView1.bounds.width, height: scrollView1.bounds.height)
            //添加imageView到视图中
            scrollView1.addSubview(imageView)
            
        }
        //scrollView1的内容大小为
        scrollView1.contentSize = CGSize(width: scrollView1.bounds.width * 5, height: scrollView1.bounds.height)
        //一页一页的
        scrollView1.isPagingEnabled = true
        //水平scroller为false
        scrollView1.showsHorizontalScrollIndicator = false
        //pageController的总页数为五页
        pageController.numberOfPages = 5
        //一开始的现页面为0
        pageController.currentPage = 0
        
        
        //缩放
        scrollView2.contentSize = CGSize(width: scrollView2.bounds.width, height: scrollView2.bounds.height)
        //放大最大的比例
        scrollView2.maximumZoomScale = 10
        //缩小最小的比例
        scrollView2.maximumZoomScale = 0.1
        scrollView2.delegate = self
        
        let imageView = UIImageView(image:UIImage(named:"2"))
        imageView.frame = CGRect(x: 0, y: 0, width: scrollView2.bounds.width, height: scrollView2.bounds.height)
        //缩放内容以填充视图大小的选项。部分内容可能会被裁剪以填充视图的边界。
        imageView.contentMode = .scaleAspectFill
        scrollView2.addSubview(imageView)
    }
    //告诉委托滚动视图已停止减速滚动运动。表示滚屏完，可以得到属性conteOffSet，相距（0，0）的位置
    //滚动视图在滚动停止时调用此方法。UIScrollView的is减速属性控制减速。
    //图片滚动到的位置，实现scrollview里面的图片滚动后，将pagecontroll的当前页做相应的更改
    //控制滚动条的小白点的移动
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //scrollView的偏移位置除以宽度为现在页数
        let currentPage = scrollView.contentOffset.x/scrollView.bounds.width
        pageController.currentPage = Int(currentPage)
    }
    //实现UIScrollViewDelegate中的方法，返回需要缩放的视图即可
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView2.subviews.first
    }
     //再点击滚动条上的点，可跳转到当前页数
    @IBAction func pageControllerClcked(_ sender: UIPageControl) {
        //获取当前页数
        let currentPage = sender.currentPage
        //滚动需要可视的矩形
        let rect = CGRect(x: CGFloat(currentPage)*scrollView1.bounds.width, y: 0, width: scrollView1.bounds.width, height: scrollView1.bounds.height)
        //滚动内容的特定区域，使其在接收器中可见。
        //定义内容视图区域的矩形。矩形应该位于滚动视图的坐标空间中。
        scrollView1.scrollRectToVisible(rect, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

