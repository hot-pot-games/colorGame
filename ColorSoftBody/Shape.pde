//注意1，数组大小为归一化数值，0.05-1之间（可超过1，小于0.05视为没有）
//注意2，数组每一行长度应相同，不然会出现空指针情况！

float[][] bp_man = {{0,0,0,0,1,1,1,0,0,0,0},
                    {0,0,0,0,1,1,1,0,0,0,0},
                    {0,0,0,0,0,1,0,0,0,0,0},
                    {1,1,1,1,1,1,1,1,1,1,1},
                    {0,0,0,0,1,1,1,0,0,0,0},
                    {0,0,0,0,1,1,1,0,0,0,0},
                    {0,0,0,0,1,1,1,0,0,0,0},
                    {0,0,0,0,1,0,1,0,0,0,0},
                    {0,0,0,0,1,0,1,0,0,0,0},
                    {0,0,0,1,1,0,1,1,0,0,0}};
                    
                    
float[][] bp_chair = {{0,1,0,0,0,0},
                      {0,1,0,0,0,0},
                      {0,1,0,0,0,0},
                      {0,1,1,1,1,1},
                      {0,1,0,0,0,1},
                      {0,1,0,0,0,1},
                      {0,1,0,0,0,1},
                      {0,1,0,0,0,1}};