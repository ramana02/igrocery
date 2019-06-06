package com.ramana.iGrocery;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.facebook.share.model.SharePhoto;
import com.facebook.share.model.SharePhotoContent;
import com.facebook.share.widget.ShareDialog;
import com.squareup.picasso.MemoryPolicy;
import com.squareup.picasso.NetworkPolicy;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class GroceryActivity extends AppCompatActivity {
    TextView tvrname,tvrphone,tvraddress,tvrloc;
    ImageView imgGroc;
    ListView lvprod;
    Dialog myDialogWindow;
    ArrayList<HashMap<String, String>> prodlist;
    String userid,grocid,userphone;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_grocery);
        Intent intent = getIntent();
        Bundle bundle = intent.getExtras();
        grocid = bundle.getString("grocid");
        String rname = bundle.getString("name");
        String rphone = bundle.getString("phone");
        String raddress = bundle.getString("address");
        String rlocation = bundle.getString("location");
        userid = bundle.getString("userid");
        userphone = bundle.getString("userphone");
        initView();
        tvrname.setText(rname);
        tvraddress.setText(raddress);
        tvrphone.setText(rphone);
        tvrloc.setText(rlocation);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        Picasso.with(this).load("https://shaunmhaathy.000webhostapp.com/kedai/"+grocid+".jpg")
                .fit().into(imgGroc);
        //  .memoryPolicy(MemoryPolicy.NO_CACHE).networkPolicy(NetworkPolicy.NO_CACHE)

        lvprod.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                showProductDetail(position);
            }
        });
        loadProduct(grocid);

    }

    private void showProductDetail(int p) {
        myDialogWindow = new Dialog(this, android.R.style.Theme_DeviceDefault_Light_Dialog_NoActionBar_MinWidth);//Theme_DeviceDefault_Dialog_NoActionBar
        myDialogWindow.setContentView(R.layout.dialog_window);
        myDialogWindow.getWindow().setBackgroundDrawableResource(android.R.color.transparent);
        TextView tvfname,tvfprice,tvfquan;
        final ImageView imgprod = myDialogWindow.findViewById(R.id.imageViewFood);
        final Spinner spquan = myDialogWindow.findViewById(R.id.spinner2);
        Button btnorder = myDialogWindow.findViewById(R.id.button2);
        final ImageButton btnfb = myDialogWindow.findViewById(R.id.btnfacebook);
        tvfname= myDialogWindow.findViewById(R.id.textView12);
        tvfprice = myDialogWindow.findViewById(R.id.textView13);
        tvfquan = myDialogWindow.findViewById(R.id.textView14);
        tvfname.setText(prodlist.get(p).get("prodname"));
        tvfprice.setText(prodlist.get(p).get("prodprice"));
        tvfquan.setText(prodlist.get(p).get("prodquantity"));
        final String prodid =(prodlist.get(p).get("prodid"));
        final String prodname = prodlist.get(p).get("prodname");
        final String prodprice = prodlist.get(p).get("prodprice");
        btnorder.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String fquan = spquan.getSelectedItem().toString();
                dialogOrder(prodid,prodname,fquan,prodprice);
            }
        });

        btnfb.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Bitmap image = ((BitmapDrawable)imgprod.getDrawable()).getBitmap();
                SharePhoto photo = new SharePhoto.Builder()
                        .setBitmap(image)
                        .build();
                SharePhotoContent content = new SharePhotoContent.Builder()
                        .addPhoto(photo)
                        .build();

                ShareDialog shareDialog = new ShareDialog(GroceryActivity.this);
                shareDialog.show(content);
            }
        });

        int quan = Integer.parseInt(prodlist.get(p).get("prodquantity"));
        List<String> list = new ArrayList<String>();
        for (int i = 1; i<=quan;i++){
            list.add(""+i);
        }
        ArrayAdapter<String> dataAdapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_spinner_item, list);
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spquan.setAdapter(dataAdapter);

        Picasso.with(this).load("https://shaunmhaathy.000webhostapp.com/barang/"+prodid+".jpg")
                .memoryPolicy(MemoryPolicy.NO_CACHE).networkPolicy(NetworkPolicy.NO_CACHE)
                .fit().into(imgprod);
        myDialogWindow.show();
    }

    private void dialogOrder(final String prodid, final String prodname, final String fquan, final String prodprice) {
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(this);
        alertDialogBuilder.setTitle("Order "+prodname+ " with quantity "+fquan);

        alertDialogBuilder
                .setMessage("Are you sure")
                .setCancelable(false)
                .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                       insertCart(prodid,prodname,fquan,prodprice);
                    }
                })
                .setNegativeButton("No", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
        AlertDialog alertDialog = alertDialogBuilder.create();
        alertDialog.show();
    }


    private void insertCart(final String prodid, final String prodname, final String fquan, final String prodprice) {
        class InsertCart extends AsyncTask<Void,Void,String>{

            @Override
            protected String doInBackground(Void... voids) {
                HashMap<String,String> hashMap = new HashMap<>();
                hashMap.put("prodid",prodid);
                hashMap.put("grocid",grocid);
                hashMap.put("prodname",prodname);
                hashMap.put("quantity",fquan);
                hashMap.put("prodprice",prodprice);
                hashMap.put("userid",userphone);
                RequestHandler rh = new RequestHandler();
                String s = rh.sendPostRequest("https://shaunmhaathy.000webhostapp.com/insert_cart2.php",hashMap);
                return s;
            }

            @Override
            protected void onPostExecute(String s) {
                super.onPostExecute(s);
                //Toast.makeText(GroceryActivity.this,s, Toast.LENGTH_SHORT).show();
                if (s.equalsIgnoreCase("success")){
                    Toast.makeText(GroceryActivity.this, "Success", Toast.LENGTH_SHORT).show();
                    myDialogWindow.dismiss();
                    loadProduct(grocid);
                }else{
                    Toast.makeText(GroceryActivity.this, "Failed", Toast.LENGTH_SHORT).show();
                }
            }

        }
        InsertCart insertCart = new InsertCart();
        insertCart.execute();
    }


    private void loadProduct(final String grocid) {
        class LoadProduct extends AsyncTask<Void,Void,String>{

            @Override
            protected String doInBackground(Void... voids) {
                HashMap<String,String> hashMap = new HashMap<>();
                hashMap.put("grocid",grocid);
                RequestHandler requestHandler = new RequestHandler();
                String s = requestHandler.sendPostRequest("https://shaunmhaathy.000webhostapp.com/load_foods.php",hashMap);
                return s;
            }
            @Override
            protected void onPostExecute(String s) {
                super.onPostExecute(s);
                prodlist.clear();
                try {
                    JSONObject jsonObject = new JSONObject(s);
                    JSONArray productarray = jsonObject.getJSONArray("product");
                    for (int i = 0; i < productarray.length(); i++) {
                        JSONObject c = productarray.getJSONObject(i);
                        String jsid = c.getString("prodid");
                        String jsfname = c.getString("prodname");
                        String jsfprice = c.getString("prodprice");
                        String jsquan = c.getString("quantity");
                        HashMap<String,String> prodlisthash = new HashMap<>();
                       prodlisthash.put("prodid",jsid);
                        prodlisthash.put("prodname",jsfname);
                        prodlisthash.put("prodprice",jsfprice);
                        prodlisthash.put("prodquantity",jsquan);
                        prodlist.add(prodlisthash);
                    }
                }catch(JSONException e){}
                ListAdapter adapter = new CustomAdapterProduct(
                        GroceryActivity.this, prodlist,
                        R.layout.prod_list_groc, new String[]
                        {"prodname","prodprice","prodquantity"}, new int[]
                        {R.id.textView,R.id.textView2,R.id.textView3});
                lvprod.setAdapter(adapter);

            }
        }
        LoadProduct loadProduct = new LoadProduct();
        loadProduct.execute();
    }

    private void initView() {
        imgGroc = findViewById(R.id.imageView3);
        tvrname = findViewById(R.id.textView6);
        tvrphone = findViewById(R.id.textView7);
        tvraddress = findViewById(R.id.textView8);
        tvrloc = findViewById(R.id.textView9);
        lvprod = findViewById(R.id.listviewfood);
        prodlist = new ArrayList<>();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                Intent intent = new Intent(GroceryActivity.this,MainActivity.class);
                Bundle bundle = new Bundle();
                bundle.putString("userid",userid);
                bundle.putString("phone",userphone);
                intent.putExtras(bundle);
                intent.setFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                startActivity(intent);
                this.finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
