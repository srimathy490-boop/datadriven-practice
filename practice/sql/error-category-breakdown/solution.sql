select 
 case when lower(err_type) like '%timeout%' then 'timeout'
      when lower(err_type) like '%memory%' then 'memory'
      else 'other'
  end as error_category,
  count(*) as track_count
 from err_tracks
 group by error_category;
