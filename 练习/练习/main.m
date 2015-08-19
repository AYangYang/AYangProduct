//
//  main.m
//  练习
//
//  Created by lanou3g on 15/6/11.
//  Copyright (c) 2015年 lanou3g.com 蓝欧科技. All rights reserved.
//

#import <Foundation/Foundation.h>

int maxvalue(int a,int b);
int maxvalue(int a,int b){
    return a>b?a:b;
}

int sum(int a,int b);
int sum(int a,int b){
    return a+b;
}

int mul(int a,int b);
int mul(int a,int b){
    return a*b;
}

typedef int (*FUNC)(int,int);


typedef struct{
    char name[20];
    FUNC function;
}NameFunctionPair;


FUNC getFunctionByName(char*name,NameFunctionPair* p,int count);
FUNC getFunctionByName(char*name,NameFunctionPair* p,int count){
    for (int i=0; i<count; i++) {
        if (strcmp(p[i].name, name)==0) {
            return p[i].function;
        }
    }
    return NULL;
}




int main(int argc, const char * argv[]) {
    NameFunctionPair pair1={"max",maxvalue};
    NameFunctionPair pair2={"sum",sum};
    NameFunctionPair pair3={"mul",mul};
    NameFunctionPair pairs[3]={pair1,pair2,pair3};
    FUNC p=NULL;
    char order[20];
    while (1) {
        printf("\n请输入指令:");
        scanf("%s",order);
        if (strcmp("max", order)==0) {
            break;
        }
        if (strcmp("sum", order)==0) {
            break;
        }
        if (strcmp("mul", order)==0) {
            break;
        }else{
            printf("输入指令有误!\n");
        }
    }
    p=getFunctionByName(order,pairs,3);
    int v=p(3,5);
    printf("%d",v);
    return 0;
}
