package org.hse.android;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

public class DemoActivity extends AppCompatActivity {

    private TextView result;
    private EditText number;

    @Override protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_demo);

        View button1 = findViewById(R.id.button1);
        View button2 = findViewById(R.id.button2);
        number = findViewById(R.id.number);
        result = findViewById(R.id.result);

        //number.setText("0");
        //number.setOnClickListener(new View.OnClickListener() { @Override public void onClick(View v) {number.getText().clear();}});
        button1.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { Clicker("b1"); }
        });
        button2.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { Clicker("b2"); }
        });
    }
    private void Clicker(String s){
        String check_null = number.getText().toString();
        Long longstr = Long.parseLong(check_null);
        if (check_null!=""||check_null!=null){
            if (longstr > 100){
                Toast.makeText(DemoActivity.this, "Введите от 0 до 100", Toast.LENGTH_SHORT).show();
                number.getText().clear();
            }
            else{
                if (s == "b1"){ clickButton1(); }
                else if(s == "b2"){ clickButton2(); }
                else{ Log.e("Status","Error"); }
            }
        }
        else{
            Toast.makeText(DemoActivity.this, "Введите от 0 до 100", Toast.LENGTH_SHORT).show();
            number.getText().clear();
        }
    }
    private void clickButton1() {
        String numberVal = number.getText().toString();
        //number.getText().clear();
        if (numberVal.isEmpty()) {
            number.setText("0");
            numberVal = "0";
        }
        int count = Integer.parseInt(numberVal);

        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < count; i++) list.add(i + 1);

        int sum = 0;
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.N) {
            sum = list.stream().mapToInt(Integer::intValue).sum();
        }
        result.setText(String.format("Result: %d", sum));
    }
    private void clickButton2() {
        //Log.d("Status","Button 2 pressed");
        //Toast.makeText(DemoActivity.this,"Button 2 pressed",Toast.LENGTH_SHORT).show();
        String numberVal = number.getText().toString();
        //number.getText().clear();
        if (numberVal.isEmpty()) {
            number.setText("0");
            numberVal = "0";
        }
        int count = Integer.parseInt(numberVal);

        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            if (i % 2 == 0) list.add(i);
            else continue;
        }

        int sum = 0;
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.N) {
            sum = list.stream().mapToInt(Integer::intValue).sum();
        }
        result.setText(String.format("Result: %d", sum));
    }
}