class UsageController < ApplicationController
  
  def index
    usage_stats = Vmstat.snapshot
    free_memory = usage_stats.memory.free_bytes
    ram_capacity = usage_stats.memory.total_bytes
    disk_count = usage_stats.disks.size
    filesystem = usage_stats.disks[0].type
    block_size = usage_stats.disks[0].block_size
    storage_capacity = usage_stats.disks[0].total_bytes
    free_storage = usage_stats.disks[0].free_bytes
    mount_point = usage_stats.disks[0].mount
    cpu_count = usage_stats.cpus.length
    cpu_load_one = usage_stats.load_average[:one_minute] * 100
    cpu_load_five = usage_stats.load_average[:five_minutes] * 100
    cpu_load_fifteen = usage_stats.load_average[:fifteen_minutes] * 100
    disk_percentage = 100 - (((free_storage.to_f / storage_capacity.to_f) * 100)).truncate
    
    res = {
      :ram_capacity => ram_capacity,
      :free_ram => free_memory,
      :current_ram_usage => ram_capacity - free_memory,
      :cores_available => cpu_count,
      :cpu_load_one => cpu_load_one,
      :cpu_load_five => cpu_load_five,
      :cpu_load_fifteen => cpu_load_fifteen,
      :disk_count => disk_count,
      :filesystem => filesystem,
      :storage_capacity => storage_capacity,
      :free_storage => free_storage,
      :disk_percentage => disk_percentage,
      :block_size => block_size,
      :mount_point => mount_point
    }
    render json: res, status: :ok
  end

end
