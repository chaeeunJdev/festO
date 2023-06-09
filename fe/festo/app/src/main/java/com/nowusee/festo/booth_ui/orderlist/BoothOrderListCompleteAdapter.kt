package com.nowusee.festo.booth_ui.orderlist

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.nowusee.festo.R
import com.nowusee.festo.booth_ui.BoothMainActivity
import com.nowusee.festo.data.res.BoothOrderListCompleteRes

class BoothOrderListCompleteAdapter(private var list: MutableList<BoothOrderListCompleteRes>) :
    RecyclerView.Adapter<BoothOrderListCompleteAdapter.ListItemViewHolder>() {
    inner class ListItemViewHolder(itemView: View?) : RecyclerView.ViewHolder(itemView!!),
        View.OnClickListener {
        init {
            itemView!!.setOnClickListener(this)
            }
        override fun onClick(v: View?) {
            val position = adapterPosition

            val clickedItem = list[position]

            val fragment = BoothOrderListDetailFragment.newInstance2(clickedItem)
            val fragmentManager = (v?.context as BoothMainActivity).supportFragmentManager
            fragmentManager.beginTransaction().replace(R.id.booth_layout_nav_bottom, fragment)
                .addToBackStack(null)
                .commit()
        }
        var ordernum: TextView = itemView!!.findViewById(R.id.tv_booth_ordernum_complete)
        var orderdate: TextView = itemView!!.findViewById(R.id.tv_booth_orderdate_complete)
        var ordertime: TextView = itemView!!.findViewById(R.id.tv_booth_ordertime_complete)
        var orderlist: TextView = itemView!!.findViewById(R.id.tv_booth_orderlist_complete)
        fun bind(data: BoothOrderListCompleteRes, position: Int) {
            ordernum.text = data.orderNo.number.toString()
            var time = data.time
            orderdate.text = time.substring(0 until 10)
            ordertime.text = time.substring(11)
            orderlist.text = "${data.firstMenuName} 외 ${data.etcCount.toString()}개"
        }

    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ListItemViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.list_item_booth_orderlist_complete, parent, false)
        return ListItemViewHolder(view)
    }

    override fun getItemCount(): Int {
        return list.count()
    }

    override fun onBindViewHolder(
        holder: BoothOrderListCompleteAdapter
        .ListItemViewHolder, position: Int
    ) {
        holder.bind(list[position], position)
    }
}