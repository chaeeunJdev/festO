package com.example.festo.customer_ui.home



import RetrofitClient
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.util.Log

import android.view.LayoutInflater

import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView

import com.example.festo.R
import com.example.festo.customer_ui.search.SearchActivity
import com.example.festo.data.API.UserAPI
import com.example.festo.data.res.FestivalListRes
import com.example.festo.databinding.FragmentHomeBinding
import retrofit2.Call
import retrofit2.Response
import com.example.festo.data.res.FestivalListRes as FestivalListRes1


class HomeFragment : Fragment() {
    private var retrofit = RetrofitClient.client
    private var festivalList = emptyList<FestivalListRes>()

    private var mBinding: FragmentHomeBinding? = null
    private var listAdapter: FestivalItemListAdapter? = null


    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        var binding = FragmentHomeBinding.inflate(inflater, container, false)
        mBinding = binding


        listAdapter = FestivalItemListAdapter(festivalList)
        mBinding?.festivalRecyclerView?.layoutManager = LinearLayoutManager(activity, RecyclerView.VERTICAL, false)
        mBinding?.festivalRecyclerView?.adapter = listAdapter

        val api = retrofit?.create(UserAPI::class.java)
        val sharedPreferences = requireContext().getSharedPreferences("myPrefs", Context.MODE_PRIVATE)
        val myValue = sharedPreferences.getString("myToken", "")
        val token = "$myValue"
        api!!.getFestivalList(token).enqueue(object:retrofit2.Callback<List<FestivalListRes>> {
            override fun onResponse(
                call: Call<List<FestivalListRes>>,
                response: Response<List<FestivalListRes>>
            ) {
                if (response.isSuccessful) {
                    Log.i("성공다", "${response.body()}")
                    festivalList = response.body()?: emptyList()
                    // 리사이클러뷰 업데이트
                    listAdapter?.updateList(festivalList)
                }
            }
            override fun onFailure(call: Call<List<FestivalListRes>>, t: Throwable) {
                Log.i("실패다", "$t")
            }
        })

        mBinding!!.notificationBtn.setOnClickListener{
            val transaction = fragmentManager?.beginTransaction()
            transaction?.replace(R.id.layout_nav_bottom, NotificationFragment())
            transaction?.commit()
        }

        // 검색창 클릭시 검색 액티비티로 이동
        mBinding!!.searchView.setOnQueryTextFocusChangeListener { _, hasFocus ->
            if (hasFocus) {
                val intent = Intent(requireActivity(), SearchActivity::class.java)
                requireActivity().startActivity(intent)
            }
        }
        return mBinding?.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        /*listAdapter = FestivalItemListAdapter(festivalList)
        mBinding?.festivalRecyclerView?.layoutManager = LinearLayoutManager(activity, RecyclerView.VERTICAL, false)*/
    }

    override fun onDestroyView() {
        mBinding = null
        super.onDestroyView()
    }
}