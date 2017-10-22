class UsageController < ApplicationController
  
  def index
    usage_stats = Vmstat.snapshot
    free_memory = usage_stats.memory.free_bytes
    ram_capacity = usage_stats.memory.total_bytes
    res = {
      :ram_stats => {
        :ram_capacity => ram_capacity,
        :ram_free => free_memory
      },
      :cpu_stats => {
        :cpu_cores => usage_stats.cpus.length
      },
      :disk_stats => {}
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
