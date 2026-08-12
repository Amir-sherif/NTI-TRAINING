module multiple;

  reg [3:0] a, b, c;

  reg [4:0] p_blk, q_blk;
  reg [3:0] m_blk, n_blk;

  reg [4:0] p_nblk, q_nblk;
  reg [3:0] m_nblk, n_nblk;

  always @(a, b, c) begin
    m_blk = a;
    n_blk = b;
    p_blk = m_blk + n_blk;

    m_blk = c;
    q_blk = m_blk + n_blk;
  end

  always @(a, b, c, m_nblk, n_nblk) begin
    m_nblk <= a;
    n_nblk <= b;
    p_nblk <= m_nblk + n_nblk;

    m_nblk <= c;
    q_nblk <= m_nblk + n_nblk;
  end


endmodule
