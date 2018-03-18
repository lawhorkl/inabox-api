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
    res = {
      :ram_capacity => ram_capacity,
      :free_ram => free_memory,
      :current_ram_usage => ram_capacity - free_memory,
      :cores_available => usage_stats.cpus.length,
      :disk_count => disk_count,
      :filesystem => filesystem,
      :storage_capacity => storage_capacity,
      :free_storage => free_storage,
      :block_size => block_size,
      :mount_point => mount_point,
    }
    render json: res, status: :ok
  end

  def memory
    # memory_stats = Vmstat.snapshft.memory
    render json: memory_stats, status: :ok
  end

  def cpu
    cpu_stats = Vmstat.snapshot.cpus
    render json: cpu_stats, status: :ok
  end

  def disk
    disk_stats = Vmstat.snapshot.disks
    render json: disk_stats, status: :ok
  end

end
