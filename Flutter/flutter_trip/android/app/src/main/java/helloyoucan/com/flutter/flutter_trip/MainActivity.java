package helloyoucan.com.flutter.flutter_trip;

import android.os.Bundle;

import androidx.annotation.Nullable;

import org.devio.flutter.splashscreen.SplashScreen;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        SplashScreen.show(this,true);
        super.onCreate(savedInstanceState);
    }
}
