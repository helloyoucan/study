package com.helloyoucan.flutterhybridandroid;

import android.os.Bundle;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentTransaction;

import android.view.View;
import android.widget.FrameLayout;

import io.flutter.embedding.android.FlutterFragment;
import io.flutter.embedding.android.FlutterView;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.dart.DartExecutor;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        findViewById(R.id.test).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                /**
                 * 方式一
                 */
//                FragmentTransaction tx  = getSupportFragmentManager().beginTransaction();
//                FlutterFragment fragment = FlutterFragment.withNewEngine().initialRoute("{name:'devio',dataList:['aa','bb','cc']}").build();
//                tx.replace(R.id.someContainer, fragment);
//                tx.commit();
                /**
                 * 方式二
                 */
                FlutterView flutterView = new FlutterView(MainActivity.this);
//                View flutterView  = Flutter.createView(MainActivity.this,getLifecycle(),"route1");
                FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(600,800);
//                addContentView(flutterView,layout);
                FrameLayout someContainer = findViewById(R.id.someContainer);
                someContainer.addView(flutterView, layout);
                // 关键代码，将Flutter页面显示到FlutterView中
//                FlutterEngine flutterEngine = new FlutterEngine(MainActivity.this);
//                flutterEngine.getNavigationChannel().setInitialRoute("/");
//                flutterEngine.getDartExecutor().executeDartEntrypoint(
//                        DartExecutor.DartEntrypoint.createDefault()
//                );
//                flutterView.attachToFlutterEngine(flutterEngine);
            }
        });
    }
}