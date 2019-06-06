package com.ramana.iGrocery;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SimpleAdapter;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import de.hdodenhof.circleimageview.CircleImageView;

public class CustomAdapterProduct extends SimpleAdapter {

    private Context mContext;
    public LayoutInflater inflater=null;
    public CustomAdapterProduct(Context context, List<? extends Map<String, ?>> data, int resource, String[] from, int[] to) {
        super(context, data, resource, from, to);
        mContext = context;
        inflater = (LayoutInflater)mContext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View vi=convertView;
        try{
            if(convertView==null)
                vi = inflater.inflate(R.layout.prod_list_groc, null);
            HashMap<String, Object> data = (HashMap<String, Object>) getItem(position);
            TextView tvprodname = vi.findViewById(R.id.textView);
            TextView tvprodprice = vi.findViewById(R.id.textView2);
            TextView tvquantity = vi.findViewById(R.id.textView3);
            CircleImageView imgprod =vi.findViewById(R.id.imageView2);
            String dfname = (String) data.get("prodname");//hilang
            String dprodprice =(String) data.get("prodprice");
            String dprodquan =(String) data.get("prodquantity");
            String dfid=(String) data.get("prodid");

            tvprodname.setText(dfname);
            tvprodprice.setText(dprodprice);
            tvquantity.setText(dprodquan);
            String image_url = "https://shaunmhaathy.000webhostapp.com/barang/"+dfid+".jpg";
            Picasso.with(mContext).load(image_url)
                    .fit().into(imgprod);
//                    .memoryPolicy(MemoryPolicy.NO_CACHE).networkPolicy(NetworkPolicy.NO_CACHE)

        }catch (IndexOutOfBoundsException e){

        }

        return vi;
    }
}