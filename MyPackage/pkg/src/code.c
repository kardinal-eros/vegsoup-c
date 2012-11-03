/*
 *  bar.c
 *  tmp
 *
 *  Created by Roland Kaiser on 24.10.12.
 *  Copyright 2012 Universität Salzburg. All rights reserved.
 *
 */

#include <R_ext/Arith.h>
#include <R_ext/Print.h>
#include <R.h>
#include <Rmath.h>
#include <float.h>

void testcode(char *plot, char *abbr, char *layer, char *cov, int *mode){
    char first_s[] = "He Börni,";
    char second_s[] = "Du alter Hasenstauber!";
    int i = 0;
    int x = 0;
    
    char long_s[sizeof(first_s) + sizeof(second_s)];
    while(first_s[i])
    {
        long_s[i] = first_s[i];
        ++i;
    }
    long_s[i] = ' ';
    ++i;
    
    while(second_s[x])
    {
        long_s[i] = second_s[x];
        ++i;
        ++x;
    }
    long_s[i] = '\0'; /* don't forget the null */
    
    printf(long_s);
    putchar('\n');
    
    getchar();
    return TRUE;
    

}

/*	as.numeric return int */
/*	as.character char */
/*	as.binary bool */
