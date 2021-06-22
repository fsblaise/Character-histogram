#include <stdio.h>

extern void character_histogram(char *text, int histogram[26]);

/*void character_histogram(char *text, int histogram[26]){
    //ecx = histogram[0]

    //eax = 0 (int i = 0)
    //loop1:
    for (int i = 0; i < 26; ++i) {
        histogram[i] = 0;
    }
    //foresz:
    int i = 0; //ebx = 0
    //eax = *text, text[0]

    //loop2:
    while(text[i] != '\0'){
        //loop3:
        for (int j = 0; j < 26; ++j) { //j = edx
            if((97 + j) == text[i]){
                histogram[j]++;
                break;
            }
        }
        i++;
    }
}*/

int main() {
    char *text = "egyaprocskakalaposckabennecsacskamacskamocska";
    int histogram[26] = {1,2,5};

    character_histogram(text, histogram);
    /*for (int i = 0; i < 26; ++i) {
        printf("%c:%d\n", i + 97, histogram[i]);
    }*/
    return 0;
}
