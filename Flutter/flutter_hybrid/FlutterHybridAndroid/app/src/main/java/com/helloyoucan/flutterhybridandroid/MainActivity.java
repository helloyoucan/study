package com.helloyoucan.flutterhybridandroid;
import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentTransaction;

import android.view.View;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterFragment;


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
                // 使用FlutterEngineCache
                FragmentTransaction tx  = getSupportFragmentManager().beginTransaction();
                FlutterFragment fragment = FlutterFragment.withCachedEngine("my_engine_id").build();
                tx.replace(R.id.someContainer, fragment);
                tx.commit();
                /**
                 * 方式二
                 */
                // 启动在AndroidManifest.xml中注册FlutterActivity
//                startActivity( FlutterActivity.createDefaultIntent(MainActivity.this));
                // 启动FlutterActivity并打开"/"路由
//                startActivity(FlutterActivity.withNewEngine().initialRoute("/").build(MainActivity.this));

                /**
                 * 使用FlutterEngineCache
                 */
//                startActivity(
//                        FlutterActivity
//                                .withCachedEngine("my_engine_id")
//                                .build(MainActivity.this)
//                );
            }
        });
    }
}