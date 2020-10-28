package com.helloyoucan.flutterhybridandroid;

import android.os.Bundle;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.view.View;
import android.widget.FrameLayout;

import io.flutter.embedding.android.FlutterView;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.embedding.engine.renderer.FlutterUiDisplayListener;


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

                flutterView.addOnFirstFrameRenderedListener(new FlutterUiDisplayListener(){

                    @Override
                    public void onFlutterUiDisplayed() {

                    }

                    @Override
                    public void onFlutterUiNoLongerDisplayed() {

                    }
                });
                FlutterEngine flutterEngine = new FlutterEngine(MainActivity.this);
                flutterView.attachToFlutterEngine(flutterEngine);
                flutterEngine.getNavigationChannel().setInitialRoute("/");
                flutterEngine.getDartExecutor().executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault());
                FrameLayout frameLayout=findViewById(R.id.someContainer);
                frameLayout.addView(flutterView);
            }
        });
    }
}