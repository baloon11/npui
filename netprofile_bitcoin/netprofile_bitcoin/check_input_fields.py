# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-
import re


def mach(string):
    if re.match(r'[0-9\.\,]+', string) == None:
        return False
    else:
        return True


def not_empty_float(flt):
    flt = str(flt).split()
    if len(flt) > 1:
        return False
    elif len(flt) == 0:
        return False
    else:
        if '.' == flt[0][0] or '.' == flt[0][-1] or ',' == flt[0][0] or ',' == flt[0][-1]:
            return False

        for find_letters in flt[0]:
            if mach(find_letters) == False:
                return False

        if flt[0].count('.') == 1 and len(flt[0].split('.')[1]) <= 8:
            return flt[0]

        if flt[0].count('.') == 0 and flt[0].count(',') == 1:
            flt[0] = flt[0].replace(',', '.')
            if len(flt[0].split('.')[1]) <= 8:
                return flt[0]
            else:
                return False

        if len(flt[0]) == len("".join(re.findall('\d+', flt[0]))):
            return flt[0]
    return False


def not_empty_int(number):
    number = str(number).split()
    if len(number) > 1:
        return False
    elif len(number) == 0:
        return False
    else:
        if len(number[0]) != len("".join(re.findall('\d+', number[0]))):
            return False
        else:
            return number[0]


def not_empty_str(string):
    string = str(string).split()
    if len(string) > 1:
        return False
    elif len(string) == 0:
        return False
    else:
        if len(string[0]) != len("".join(re.findall('[a-zA-Z0-9]+', string[0]))):
            return False
        else:
            return string[0]


def string_wallet_name(string):
    return ' '.join(string.split())
