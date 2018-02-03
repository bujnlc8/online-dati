# coding=utf-8

from models.models import Question
from docx import Document

path = '/Users/linghaihui/timu2.docx'

document = Document(path)
l = [ paragraph.text.encode('utf-8') for paragraph in document.paragraphs]
index = 0
timu, optionA, optionB, optionC, answer = '', '', '', '', ''
for x in l:
    if x:
        if index % 3 == 0:  # 题目
            seperators = ['、', '．', '.']
            for seperator in seperators:
                if seperator in x:
                    if int(x.split(seperator)[0]) <= 9:
                        if seperator != '.':
                            x = x[4:]
                        else:
                            x = x[2:]
                    else:
                        if seperator != '.':
                            x = x[5:]
                        else:
                            x = x[3:]
                    break
            timu = x
        if index % 3 == 1: # 选项
            segments = x.split('A')
            for sa in segments:
                if sa:
                    segmentss = sa.split('B')
                    optionA = segmentss[0].strip()
                    optionB = segmentss[1].split('C')[0].strip()
                    optionC = segmentss[1].split('C')[1].strip()
            if '、' in optionA:
                optionA = optionA[3:]
            if '、' in optionB:
                optionB = optionB[3:]
            if '、' in optionC:
                optionC = optionC[3:]
        if index % 3 == 2: # 答案
            if 'A' in x:
                answer = 'A'
            elif 'B' in x:
                answer = 'B'
            else:
                answer = 'C'
            Question.add(timu, optionA, optionB, optionC, answer)
        index += 1