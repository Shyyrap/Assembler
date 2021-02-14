#include<iostream>

int CountLength(const char* arr)
{
    int i = 0;
    while(arr[i] != 0)
    {
        i++;
    }
    return i;
}
bool Match(const char* source, int source_index,  int n_s,
        const char* pattern, int pattern_index, int n_p)
{
    if(source_index < n_s && pattern_index < n_p)
    {
        if(source[source_index] == pattern[pattern_index])
        {
            std::cout<<"Cur source = "<<source[source_index]<<std::endl;
            std::cout<<"Cur pattern = "<<pattern[pattern_index]<<std::endl;

            source_index++;
            pattern_index++;
            Match(source, source_index, n_s,
                    pattern, pattern_index, n_p);
        }
        else
        {
            if(pattern[pattern_index] == '?' )
            {
                source_index++;
                pattern_index++;
                Match(source, source_index, n_s,
                        pattern, pattern_index, n_p);
            }
            else
            {
                //here must check * 
                if(pattern[pattern_index] == '*')
                {
                    //save value next *
                    int next_pattern_symbol = pattern_index+1;
                    int i = source_index;
                    while(source[i] != pattern[next_pattern_symbol])
                    {
                        i++;
                    }
                    if(i != n_s)
                    {
                        source_index = i;
                    }
                    else
                    {
                        if(i == n_s)
                        {
                            Match(source, source_index, n_s,
                                    pattern, pattern_index, n_p);
                        }
                        else
                        {
                            Match(source, source_index, n_s, 
                                    pattern, pattern_index, n_p);
                        }
                    }
                }
                else
                {
                    return false;
                }
            }
        }
    }
    else
    {
        if(source_index == n_s)
        {
            if(pattern_index == n_p)
            {
                if(source[source_index] == pattern[pattern_index])
                {
                    return true;
                }
                else
                {
                    if(pattern[pattern_index] == '*')
                    {
                        return true;
                    }
                    else
                    {
                        if(pattern[pattern_index] == '?')
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            }
        }
    }
}

int main(int argc, char** argv)
{
    int source_index = 0;
    int pattern_index = 0;
    const char* source = "SomeBullshit";
    const char* pattern = "SomeBul?*hite";
    int n_s = CountLength(source); 
    int n_p = CountLength(pattern);
    std::cout<<"Source length = "<<n_s<<std::endl;
    std::cout<<"Pattern length = "<<n_p<<std::endl;

    if(Match(source, source_index, n_s,
                pattern, pattern_index, n_p) == true)
    {
        std::cout<<"Yes matching"<<std::endl;
    }
    else
    {
        std::cout<<"No matching"<<std::endl;
    }
    return 0;
}
